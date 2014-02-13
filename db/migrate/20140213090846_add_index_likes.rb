class AddIndexLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:visitor_id, :car_id], unique: true
  end
end
