module ApplicationHelper

  def icon(name, color = :black)
    content_tag(:i, "", :class => "icon-#{name} icon-#{color}")
  end

  def form_text_element(label_text, control_text = "", &block)
    content_tag(:div, class: "control-group text") do
      content_tag(:label, label_text, class: "control-label") +
      content_tag(:div, class: "controls") do
        output = block.call if block_given?
        control_text.to_s << output if output.is_a? String
        control_text
      end
    end
  end

end
