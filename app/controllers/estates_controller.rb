class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  # GET /estates or /estates.json
  def index
    @estates = Estate.all
  end

  # GET /estates/1 or /estates/1.json
  def show
  end

  # GET /estates/new
  def new
    @estate = Estate.new
  end

  # GET /estates/1/edit
  def edit
  end

  # POST /estates or /estates.json
  def create
    @estate = Estate.new(estate_params)

    respond_to do |format|
      if @estate.save
        format.html { redirect_to estate_url(@estate), notice: "Estate was successfully created." }
        format.json { render :show, status: :created, location: @estate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estates/1 or /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to estate_url(@estate), notice: "Estate was successfully updated." }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1 or /estates/1.json
  def destroy
    @estate.destroy

    respond_to do |format|
      format.html { redirect_to estates_url, notice: "Estate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estate_params
      params.require(:estate).permit(:title, :type, :modality, :user_id, :price, :currency, :area)
    end
end
