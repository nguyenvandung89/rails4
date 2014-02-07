class CreateExteriors < ActiveRecord::Migration
  def change
    create_table :exteriors do |t|
      t.string :color
      t.timestamps
    end
  end
end
