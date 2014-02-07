class CreateGearboxes < ActiveRecord::Migration
  def change
    create_table :gearboxes do |t|
      t.string :type
      t.string :detail

      t.timestamps
    end
  end
end
