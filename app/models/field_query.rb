class FieldQuery
  def initialize(relation = Field.all)
    @relation = relation.extending(Scopes)
  end

  def search
    @relation
  end

  module Scopes
    def from_user(user_id)
      joins(:user).where(user_id: user_id)
    end

    def combobox_key_values_from_user(user_id)
      joins(:user).where(user_id: 1).where.not(combobox_key_values: nil).pluck('combobox_key_values')
    end
  end
end
