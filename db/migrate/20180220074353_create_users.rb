class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.bigint :line_id, null: false
      t.string :line_name, null: false
      t.timestamps
    end
  end
end
