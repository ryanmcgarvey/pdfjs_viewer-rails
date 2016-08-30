require "pdfjs_viewer-rails/version"
require "pdfjs_viewer-rails/helpers"
require "font-awesome-rails"

module PdfjsViewer
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace PdfjsViewer

      initializer 'pdfjs_viewer-rails.load_static_assets' do |app|
        app.middleware.unshift ::ActionDispatch::Static, "#{root}/public"
      end

      initializer "pdfjs_viewer-rails.view_helpers" do
        ActionView::Base.send :include, ViewHelpers
        ActionView::Base.send :include, FontAwesome::Rails::IconHelper
      end
    end
  end
end
