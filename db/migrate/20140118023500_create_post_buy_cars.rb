class CreatePostBuyCars < ActiveRecord::Migration
  def change
    create_table :post_buy_cars do |t|
      t.references :m_amount
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
