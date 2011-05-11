# ace-rails

This gem provides a generator to download and install [ace (Ajax.org Cloud9 Editor)](https://github.com/ajaxorg/ace)  into your Rails 3 project. It also provides some view helper to setup an editor.

## Setup

Add the gem to your Gemfile and run *bundle*.

	gem 'ace-rails'
	
Run the generator to download and install the current version of [ace](https://github.com/ajaxorg/ace) into *public/javascripts/ace*

	rails g ace:install

## Usage

Use the helper function to create an editor within your view

	<%= ace_editor :mode => :css, :content => "body {\n\tfont-size: 12px;\n}" %>
	
the *:mode* option could be one of

	[:c_cpp, :coffee, :css, :html, :java, :javascript, :php, :python, :ruby, :xml]
	
you can also specify a *:theme* option to change the look and feel of the ace editor. By default ace loads the *textmate* theme. Currentyl available themes are:

	[:clouds, :clouds_midnight, :cobalt, :dawn, :eclipse, :idle_fingers, :kr_theme, :mongo_industrial, :monokai, :pastel_on_dark, :twilight]