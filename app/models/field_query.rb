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
  end
end
