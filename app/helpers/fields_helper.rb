module FieldsHelper
  def generate_custom_field(field_name, field_type, field_value, options_string_values)
    case field_type
    when 'text_field'
      text_field('custom_field', field_name, class: 'form-control', value: field_value)
    when 'text_area'
      text_area('custom_field', field_name, rows: 5, class: 'form-control', value: field_value)
    when 'select_tag'      
      options = options_string_to_hash(options_string_values[0])
      select('custom_field', field_name, options_from_collection_for_select(options, :first, :last, field_value))
    end
  end

  def options_string_to_hash(options_string)
    options_string.split(',').map { |i| i.split(':').each { |e| puts e.strip! } }.to_h
  end
end
