# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date date
    date.to_s[0..10]
  end
end
