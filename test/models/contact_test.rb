require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
end
