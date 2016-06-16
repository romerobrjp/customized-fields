class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :field_values
  validates_presence_of :email
end
