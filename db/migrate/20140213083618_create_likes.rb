class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :car, :visitor
    end
  end
end
