class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :title
      t.string :content
      t.datetime :date
      t.boolean :visibility
    end
  end
end
