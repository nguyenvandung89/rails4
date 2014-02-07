class CreateDrivens < ActiveRecord::Migration
  def change
    create_table :drivens do |t|
      t.string :type
      t.string :detail

      t.timestamps
    end
  end
end
