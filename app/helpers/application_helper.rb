module ApplicationHelper

  def icon(name, color = :black)
    content_tag(:i, "", :class => "icon-#{name} icon-#{color}")
  end

end
