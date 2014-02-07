class CreateMLifeCars < ActiveRecord::Migration
  def change
    create_table :m_life_cars do |t|
      t.references :m_manufacturers
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
