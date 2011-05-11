module AceRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      # def self.source_root
      #   File.dirname(__FILE__) + "/templates"
      # end
      # 
      def copy_files
        empty_directory 'public/javascripts/ace'
        # puts 'copy files'
      end
      
    end
  end
end