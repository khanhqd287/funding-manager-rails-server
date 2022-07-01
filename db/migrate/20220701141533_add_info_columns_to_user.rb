class AddInfoColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :is_linked, :boolean, default: true
  end
end
