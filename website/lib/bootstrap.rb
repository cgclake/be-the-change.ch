# MENU ACTIVE / INACTIVE FOR BOOTSTRAP
# a copy from: https://github.com/nanoc/nanoc/blob/master/lib/nanoc/helpers/link_to.rb#L90-L100

    #   link_to_unless_current('This Item', @item)
    #   # => '<span class="active" title="You\'re here.">This Item</span>'
    # <!-- <%= link_to_unless_current_bs("Home", '/') %> -->
def link_to_unless_current(text, target, attributes={})
       # Find path
      path = target.is_a?(String) ? target : target.path

      if @item_rep && @item_rep.path == path
        # Create message
        "<li class=\"active\"><a href=\"#\">#{text}</a></li>"
      else
        link_to(text, target, attributes)
      end
    end


def link_to(text, target, attributes={})
      # Find path
      if target.is_a?(String)
        path = target
      else
        path = target.path
        raise RuntimeError, "Cannot create a link to #{target.inspect} because this target is not outputted (its routing rule returns nil)" if path.nil?
      end

      # Join attributes
      attributes = attributes.inject('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end

      # Create link
      "<a #{attributes}href=\"#{h path}\">#{text}</a>"
    end
    
