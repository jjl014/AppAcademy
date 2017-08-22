class EditUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
    add_index :users, :username, unique: true
  end
end
