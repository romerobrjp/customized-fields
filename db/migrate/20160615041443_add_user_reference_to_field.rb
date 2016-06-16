class AddUserReferenceToField < ActiveRecord::Migration
  def change
    remove_reference :fields, :contact
    add_reference :fields, :user, index: true, foreign_key: true
  end
end
