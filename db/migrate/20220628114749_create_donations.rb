class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :title
      t.text :image
      t.text :description
      t.float :amount
      t.string :status
      t.timestamps
    end
  end
end
