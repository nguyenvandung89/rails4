class CreateMPrefectures < ActiveRecord::Migration
  def change
    create_table :m_prefectures do |t|
      t.string :name
      t.string :roman_name
      t.integer :sort

      t.timestamps
    end
  end
end
