class CreateMOrigins < ActiveRecord::Migration
  def change
    create_table :m_origins do |t|
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
