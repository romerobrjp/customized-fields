class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :type
      t.string :description
      t.boolean :active
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
