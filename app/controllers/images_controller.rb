class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_image, only: %i[show destroy]
  before_action :authorize_user!, only: [:destroy]

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.imageable, notice: "Image was successfully created." }
        format.json { render json: { success: true, image: image_json(@image) }, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @image.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # API endpoint for image upload (returns JSON for AJAX)
  def api_upload
    unless user_signed_in?
      return render json: { error: 'Unauthorized' }, status: :unauthorized
    end

    imageable_type = params[:imageable_type]
    imageable_id = params[:imageable_id]

    begin
      imageable = imageable_type.constantize.find(imageable_id)
    rescue
      return render json: { error: 'Resource not found' }, status: :not_found
    end

    unless can_manage?(imageable)
      return render json: { error: 'Unauthorized' }, status: :unauthorized
    end

    @image = imageable.images.build(image_params)

    if @image.save
      render json: {
        success: true,
        image: image_json(@image)
      }
    else
      render json: {
        success: false,
        errors: @image.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /images/1 or /images.json
  def destroy
    imageable = @image.imageable
    @image.destroy

    respond_to do |format|
      format.html { redirect_to imageable, notice: "Image was successfully destroyed." }
      format.json { render json: { success: true } }
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :imageable_id, :imageable_type)
  end

  def can_manage?(resource)
    resource.user_id == current_user.id || current_user.respond_to?(:admin?) && current_user.admin?
  end

  def authorize_user!
    imageable = @image.imageable
    redirect_to root_path, alert: 'Unauthorized' unless can_manage?(imageable)
  end

  def image_json(image)
    {
      id: image.id,
      url: image.image.url,
      thumb_url: image.image.thumb.url,
      medium_url: image.image.medium.url,
      created_at: image.created_at.strftime('%Y-%m-%d %H:%M:%S')
    }
  end
end
