require "rails_helper"

describe FieldValue do
  it { should belong_to :field }
  it { should belong_to :contact }
  it { should validate_presence_of :value }

  it "belongs to a field and a contact" do
    field_value = create(:field_value, :with_associations)

    expect(field_value.contact).to be_valid
    expect(field_value.field).to be_valid
  end
end
