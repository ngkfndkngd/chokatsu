class AddShapeStatusToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :shape_status, :integer, default: 0, null: false
  end
end
