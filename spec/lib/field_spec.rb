require "rails_helper"

describe Field do
  it { should belong_to :user }
  it { should have_many :field_values }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:field_type) }
  it { should define_enum_for(:types).with({text_field: 'Text', text_area: 'Text Area', combobox: 'Combobox'})}

  it "belongs to an user" do
    field = create(:field, :of_a_user)

    expect(field.user).to be_valid
  end
end
