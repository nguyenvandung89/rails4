class RenameColumnToMLifeCar < ActiveRecord::Migration
  def change
    rename_column :m_life_cars, :m_manufacturers_id, :m_manufacturer_id
  end
end
