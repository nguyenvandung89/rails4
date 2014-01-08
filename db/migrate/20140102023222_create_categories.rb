class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps
    end
  end
end
