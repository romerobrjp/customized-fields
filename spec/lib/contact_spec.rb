require "rails_helper"

describe Contact do
  it { should belong_to :user }
  it { should have_many :field_values }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

  it "has at least a name and an email" do
    contact = create(:contact)

    expect(contact.name).to_not be_nil
    expect(contact.email).to_not be_nil
  end

  it "belongs to an user" do
    contact = create(:contact, :of_a_user)

    expect(contact.user).to be_valid
  end
end
