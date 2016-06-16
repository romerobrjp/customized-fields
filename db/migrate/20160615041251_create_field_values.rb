class CreateFieldValues < ActiveRecord::Migration
  def change
    create_table :field_values do |t|
      t.string :value
      t.references :field, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
