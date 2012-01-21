module StoriesHelper

  def story_icon(story)
    if story.story_type_id == 2
      '<img src="images/tool.png" border="0" width="20">'
    elsif story.story_type_id == 3
      '<img src="images/bug-icon.gif" border="0" width="20">'
    else
      '<img src="images/Book-icon.png" border="0" width="20">'
    end
  end

end
