class FieldValueQuery
  def initialize(relation = FieldValue.all)
    @relation = relation.extending(Scopes)
  end

  def search
    @relation
  end

  module Scopes
    def specific(user_id, contact_id, field_id)
      joins(:user, :contact, :field).where(user_id: user_id, contact_id: contact_id, field_id: field_id)
    end

    def valued(user_id, contact_id, field_id, value)
      joins(:user, :contact, :field).where(user_id: user_id, contact_id: contact_id, field_id: field_id, value: value)
    end
  end
end

