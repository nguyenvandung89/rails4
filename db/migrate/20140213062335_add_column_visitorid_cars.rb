class AddColumnVisitoridCars < ActiveRecord::Migration
  def change
    add_column :cars, :visitor_id, :integer
  end
end
