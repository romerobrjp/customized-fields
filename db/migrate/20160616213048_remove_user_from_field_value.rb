class RemoveUserFromFieldValue < ActiveRecord::Migration
  def change
    remove_reference :field_values, :user
  end
end
