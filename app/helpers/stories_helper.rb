module StoriesHelper

  def story_icon story
    if story.story_type_id == 2
      '<img src="images/tool.png" border="0" width="20">'
    elsif story.story_type_id == 3
      '<img src="images/bug-icon.gif" border="0" width="20">'
    else
      '<img src="images/Book-icon.png" border="0" width="20">'
    end
  end

  def story_color story
    case story.status_id
    when 2
      return 'style="background-color:yellow;"'
    when 3
      return 'style="background-color:red;"'
    when 8
      return 'style="background-color:green;"'
    end
  end
  
  # TODO: use inject enumerator on below methods
  def total_points stories
    sum = 0
    stories.each do |story| 
      if !story.points.nil?
        sum += story.points
      end  
    end
    return sum
  end
  
  def total_blocked stories
    sum = 0
    stories.each do |story| 
      if story.status_id == 3
        sum += 1
      end  
    end
    return sum
  end
  
  def total_ready_for_qa stories
    sum = 0
    stories.each do |story| 
      if story.status_id == 8
        sum += 1
      end  
    end
    return sum
  end
end