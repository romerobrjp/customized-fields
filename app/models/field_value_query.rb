class FieldValueQuery
  def initialize(relation = FieldValue.all)
    @relation = relation.extending(Scopes)
  end

  def search
    @relation
  end

  module Scopes
    def specific(contact_id, field_id)
      where(contact_id: contact_id, field_id: field_id)
    end

    def valued(contact_id, value)
      where(contact_id: contact_id, value: value)
    end
  end
end
