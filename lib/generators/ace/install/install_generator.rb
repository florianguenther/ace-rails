require 'fileutils'

module Ace
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      @@ace_version = "0.1.6"
      @@ace_version_file = "ace-#{@@ace_version}.tgz"
      # @@ace_url = "https://github.com/downloads/ajaxorg/ace/#{@@ace_version_file}"
      @@ace_url = "http://cloud.github.com/downloads/ajaxorg/ace/#{@@ace_version_file}"
      
      @@tmp_base = "tmp/ace-install"
      @@tmp_file = File.join @@tmp_base, @@ace_version_file
      @@tmp_src_base = File.join @@tmp_base, "ace-#{@@ace_version}", "src"
      
      @@target_src = "public/javascripts/ace"
      
      class_option :download, :type => :boolean, :default => true, :desc => "Download and install ACE (#{@@ace_version}) to #{@@target_src}."
      class_option :stylesheet, :type => :boolean, :default => true, :desc => "Creates a default stylesheet and includes it to the application layout"
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end
      
      def download_and_install_ace
        return unless options.download?
        
        remove_dir @@tmp_base
        remove_dir @@target_src
        get @@ace_url, @@tmp_file
        inside @@tmp_base do
          run("tar xzf #{@@ace_version_file}")
        end

        say_status("copying", "ace (#{@@ace_version})", :green)
        FileUtils.cp_r("#{File.expand_path @@tmp_src_base}", @@target_src)
        
        remove_dir @@tmp_base
      end
      
      def copy_stylesheet
        return unless options.stylesheet?
        
        copy_file "ace-rails.css", "public/stylesheets/ace-rails.css"
        
        application_layout = File.expand_path('app/views/layouts/application.html.erb')
        stylesheet_tag = "\n  <%= stylesheet_link_tag    '/stylesheets/ace-rails.css' %>"
        inject_into_file application_layout, stylesheet_tag, :after => "</title>"
      end
      
    end
  end
end