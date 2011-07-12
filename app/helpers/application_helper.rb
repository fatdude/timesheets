module ApplicationHelper
  def root_page_of?(controller_name)
    controller.controller_name == controller_name.to_s
  end
  
  def yes_or_no(value)
    if value
      content_tag(:span, 'Yes', :class => 'icon yes')
    else
      content_tag(:span, 'No', :class => 'icon no')
    end
  end
end
