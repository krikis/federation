module HasDetails

  def details
    attributes.reject{|key, value| ['id', 'created_at', 'updated_at'].include? key}
              .map{|key, value| [key, date_to_string(value)]}
  end

  private

  def date_to_string(value)
    if value.is_a? Time
      value.strftime('%e %B %Y')
    else
      value
    end
  end

end