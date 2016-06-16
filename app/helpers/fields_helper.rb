module FieldsHelper
  def generate_custom_field(field_name, field_type, field_value, select_hash)
    #puts " >>>>> FIELD : #{field_name}"
    #field_name = field_name.downcase.parameterize('_').to_sym!
    #puts " >>>>> FIELD TRANSFORMERD: #{field_name}"
    puts " >>>>> FIELD VALUE: #{field_value}"
    case field_type
    when 'text_field'
      text_field('custom_field', field_name, class: 'form-control', value: field_value)
    when 'text_area'
      text_area('custom_field', field_name, rows: 5, class: 'form-control', value: field_value)
    when 'select_tag'
      select_tag field_name, options_from_collection_for_select(select_hash, :first, :last), class: 'selectpicker'
    end
  end
end
