# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Add here assets used on a particular page. They need to be precompiled
# Rails.application.config.assets.precompile += %w( components-jqueryui/jquery-ui.js )
# Rails.application.config.assets.precompile += %w( jquery-ui-touch-punch/jquery.ui.touch-punch.min )
Rails.application.config.assets.precompile += %w( x-editable/dist/bootstrap3-editable/css/bootstrap-editable.css )
# Rails.application.config.assets.precompile += %w( x-editable/dist/bootstrap3-editable/js/bootstrap-editable.min.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( estates.css )
Rails.application.config.assets.precompile += %w( services.css )
Rails.application.config.assets.precompile += %w( profiles.css )
Rails.application.config.assets.precompile += %w( accounts.css )
Rails.application.config.assets.precompile += %w( articles.css )
Rails.application.config.assets.precompile += %w( feedbacks.css )
Rails.application.config.assets.precompile += %w( messages.css )
Rails.application.config.assets.precompile += %w( jobs.css )
Rails.application.config.assets.precompile += %w( experiences.css )
Rails.application.config.assets.precompile += %w( learnings.css )
Rails.application.config.assets.precompile += %w( favorites.css )
Rails.application.config.assets.precompile += %w( friendships.css )
Rails.application.config.assets.precompile += %w( images.css )
Rails.application.config.assets.precompile += %w( locations.css )
Rails.application.config.assets.precompile += %w( scores.css )
