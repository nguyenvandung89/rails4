class AddColumnsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :image1, :string
    add_column :cars, :image2, :string
    add_column :cars, :image3, :string
    add_column :cars, :image4, :string
    add_column :cars, :image5, :string
    add_column :cars, :image6, :string
    add_column :cars, :image7, :string
  end
end
