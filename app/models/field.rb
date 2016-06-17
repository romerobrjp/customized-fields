class Field < ActiveRecord::Base
  belongs_to :user
  has_many :field_values, dependent: :destroy
  validates_presence_of :name, :field_type
  enum types: {text_field: 'Text', text_area: 'Text Area', combobox: 'Combobox'}
end
