require "rails_helper"

describe User do
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  it { should have_many :fields }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "has email and password validated by devise" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = create(:user)
    user.email = nil

    expect(user).to_not be_valid
  end

  it "is not valid without an password" do
    user = create(:user)
    user.password = nil

    expect(user).to_not be_valid
  end

  it "has a valid email" do
    user = create(:user)

    expect(user.email).to match(VALID_EMAIL_REGEX)
  end
end
