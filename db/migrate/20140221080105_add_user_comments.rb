class AddUserComments < ActiveRecord::Migration
  def change
    add_column :comments, :visitor_id, :integer
  end
end
