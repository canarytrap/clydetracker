module StoriesHelper

  def story_icon story
    if story.story_type_id == 2
      '<img src="images/tool.png" border="0" width="16">'
    elsif story.story_type_id == 3
      '<img src="images/bug.png" border="0" width="16">'
    else
      '<img src="images/Book-icon.png" border="0" width="16">'
    end
  end

  def story_color story
    case story.status_id
    when 2
      return 'style="background-color:#FFF68F;"'
    when 3
      return 'style="background-color:#FF6A6A;"'
    when 4
      return 'style="background-color:#43CD80;"'      
    when 8
      return 'style="background-color:#90EE90;"'
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

  def total_points_left stories
    # TODO: refactor this
    unfinished_status = [1, 2, 3, 8]
    sum = 0
    stories.each do |story|
      if !story.points.nil?
        if unfinished_status.include? story.status_id
            sum += story.points
        end  
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
  
  def format_title story, length
    return (story.title.length > length) ? story.title[0..length] + '..' : story.title
  end
end