class RenameColumnToDrivens < ActiveRecord::Migration
  def change
    rename_column :drivens, :type, :driven_type
    rename_column :gearboxes, :type, :gearbox_type
  end
end
