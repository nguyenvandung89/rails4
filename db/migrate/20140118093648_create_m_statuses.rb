class CreateMStatuses < ActiveRecord::Migration
  def change
    create_table :m_statuses do |t|
      t.string :status
      t.timestamps
    end
  end
end
