class AddSeatsToBench < ActiveRecord::Migration[5.1]
  def change
    add_column :benches, :seats, :integer, null: false
  end
end
