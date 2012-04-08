require 'test_helper'

class StoriesHelperTest < ActionView::TestCase

  test "should compute total points" do
    story1 = Story.new
    story1.points = 4
    story2 = Story.new
    story2.points = 3
    # lets not give any pts for this story
    story3 = Story.new

    stories = [story1, story2, story3]

    total = self.total_points stories

    assert_equal 7, total
  end
end
