class Field < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :field_type
  enum types: {text_field: 'Texto', text_area: 'Área de texto', select_tag: 'Combobox'}
end
