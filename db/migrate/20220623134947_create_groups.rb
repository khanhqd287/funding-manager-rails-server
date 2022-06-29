class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :host_id
      t.text :avatar
      t.float :total_payments
      t.float :total_donations
      t.timestamps
    end
  end
end
