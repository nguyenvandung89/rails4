class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :car
      t.text :comments

      t.timestamps
    end
  end
end
