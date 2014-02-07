class CreateMAmounts < ActiveRecord::Migration
  def change
    create_table :m_amounts do |t|
      t.string :amount

      t.timestamps
    end
  end
end
