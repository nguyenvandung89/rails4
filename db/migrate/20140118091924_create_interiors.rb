class CreateInteriors < ActiveRecord::Migration
  def change
    create_table :interiors do |t|
      t.string :color
      t.timestamps
    end
  end
end
