class FieldQuery
  def initialize(relation = Field.all)
    @relation = relation.extending(Scopes)
  end

  def search
    @relation
  end

  module Scopes
    def combobox_key_values
      where(field_type: Field.types[:combobox]).pluck('combobox_key_values')
    end
  end
end
