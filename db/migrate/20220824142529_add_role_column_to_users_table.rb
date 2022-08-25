class AddRoleColumnToUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :role
    end

    add_index :users, :role, unique: true
  end
end
