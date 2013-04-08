# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

module PostHelper
  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%-d.%m.%Y')
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more'><a href='#{post.path}'>Weiter lesen &rsaquo;</a></div><br>"
    end
    return content
  end

end

include PostHelper


module EventHelper
	
	def events
	  now = Time.now
	  @items.select { |item| item[:kind] == 'event' and attribute_to_time(item[:datetime]) >=now }
	  
	end
	
	def sorted_events
	  events.sort_by do |a|
	    attribute_to_time(a[:created_at])
	  end
	end


  def get_pretty_date(event)
    attribute_to_time(event[:created_at]).strftime('%-d.%m.%Y')
  end

  def get_event_start(event)
    content = event.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more'><a href='#{post.path}'>Weiter lesen &rsaquo;</a></div><br>"
    end
    return content
  end

end

include EventHelper