class AddFieldToCars < ActiveRecord::Migration
  def change
    add_column :cars, :title, :string
  end
end
