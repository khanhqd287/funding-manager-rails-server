class CreateUserGroupRefs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_group_refs do |t|
      t.string :user_id
      t.string :group_id
      t.timestamps
    end
  end
end
