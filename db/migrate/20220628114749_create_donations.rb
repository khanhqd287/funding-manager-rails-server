class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :user_id
      t.string :group_id
      t.string :title
      t.text :image
      t.text :description
      t.float :amount
      t.string :status
      t.timestamps
    end
  end
end
