class AddComboboxValuesToField < ActiveRecord::Migration
  def change
    add_column :fields, :combobox_key_values, :string
  end
end
