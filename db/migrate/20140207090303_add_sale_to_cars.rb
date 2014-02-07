class AddSaleToCars < ActiveRecord::Migration
  def change
    add_column :cars, :sale_price , :boolean
  end
end
