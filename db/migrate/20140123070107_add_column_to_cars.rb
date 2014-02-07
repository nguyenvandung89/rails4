class AddColumnToCars < ActiveRecord::Migration
  def change
    add_column :cars, :visibility, :boolean
  end
end
