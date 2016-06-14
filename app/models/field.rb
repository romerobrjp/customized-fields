class Field < ActiveRecord::Base
  belongs_to :contact
  validates_presence_of :name, :type
  enum type: [:text_field, :text_area, :select_tag]
end
