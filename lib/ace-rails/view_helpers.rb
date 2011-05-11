module Ace
  module Rails
    module ViewHelpers
      
        def ace_editor(options = {})
          id    = options[:id] || 'editor'
          mode  = options[:mode] || 'css'
          theme = options[:theme] # nil => default theme

          mode_class = "#{mode}_mode".camelize

          theme_script_tag = theme ? "<script type='text/javascript' src='/javascripts/ace/theme-#{theme}.js' charset='utf-8' ></script>" : ""
          theme_setter = theme ? "editor.setTheme('ace/theme/#{theme}');" : ""

          output = <<HTML
<div class='editor_container'>
  <pre id='#{id}'>#{options[:content]}</pre>
  <div class='editor_footer'></div>
</div>
<script type='text/javascript' src='/javascripts/ace/ace.js' charset='utf-8' ></script>
<script type='text/javascript' src='/javascripts/ace/mode-#{mode}.js' charset='utf-8' ></script>
#{theme_script_tag}
<script type='text/javascript'>
  window.onload = function() {
    var editor = ace.edit('#{id}');
    #{theme_setter}
    var #{mode_class} = require("ace/mode/#{mode}").Mode;
    editor.getSession().setMode(new #{mode_class}());
  };
</script>
HTML

          output.html_safe
        end
      
    end
  end
end