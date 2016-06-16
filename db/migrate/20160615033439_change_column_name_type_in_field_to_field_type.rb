class ChangeColumnNameTypeInFieldToFieldType < ActiveRecord::Migration
  def change
    rename_column :fields, :type, :field_type
  end
end
