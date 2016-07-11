class FieldValue < ActiveRecord::Base
  belongs_to :field
  belongs_to :contact
  validates_presence_of :value
end
