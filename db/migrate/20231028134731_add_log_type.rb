class AddLogType < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :log_type, :text
  end
end
