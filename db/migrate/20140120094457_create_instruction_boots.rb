class CreateInstructionBoots < ActiveRecord::Migration
  def change
    create_table :instruction_boots do |t|
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
