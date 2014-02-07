class CreateTableDrivenMManufacturer < ActiveRecord::Migration
  def change
    create_table :driven_m_manufacturers do |t|
      t.references :m_manufacturer
      t.references :driven
    end
  end
end
