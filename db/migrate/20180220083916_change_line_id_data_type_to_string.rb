class ChangeLineIdDataTypeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :line_id, :string
  end
end
