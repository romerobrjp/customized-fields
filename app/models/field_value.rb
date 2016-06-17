class FieldValue < ActiveRecord::Base
  belongs_to :field
  belongs_to :contact
end
