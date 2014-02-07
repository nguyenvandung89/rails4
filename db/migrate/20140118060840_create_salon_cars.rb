class CreateSalonCars < ActiveRecord::Migration
  def change
    create_table :salon_cars do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :description
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.string :background

      t.timestamps
    end
  end
end
