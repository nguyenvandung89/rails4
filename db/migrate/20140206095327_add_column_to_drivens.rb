class AddColumnToDrivens < ActiveRecord::Migration
  def change
    add_column :drivens, :image, :string
  end
end
