require 'ace-rails/view_helpers'

module Ace
  module Rails
    class Railtie < ::Rails::Railtie
      
      initializer "ace-rails.view_helpers" do
        ActionView::Base.send :include, ViewHelpers
      end
      
    end
  end
end
