module HasDetails

  extend ActiveSupport::Concern

  FILTER = ['id', 'created_at', 'updated_at']

  def details
    attributes.reject{|key, value| FILTER.include? key or not value.present?}
              .map{|key, value| [key, date_to_string(value)]}
  end

  def form_details
    self.class.form_fields.map{|key, label, type| [key, label, type, attributes[key]]}
  end

  module ClassMethods
    def form_fields
      columns.reject{|column| FILTER.include? column.name}
             .map{|column| [column.name, column.human_name, column.type]}
    end

    def human_name
      param_name.humanize
    end

    def param_name
      to_s.underscore
    end
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