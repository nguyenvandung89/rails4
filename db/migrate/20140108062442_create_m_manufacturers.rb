class CreateMManufacturers < ActiveRecord::Migration
  def change
    create_table :m_manufacturers do |t|
      t.string :name
      t.string :logo
      t.string :name_en
      t.integer :sort
      t.timestamps
    end
  end
end