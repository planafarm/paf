class ChangeEntries < ActiveRecord::Migration[5.1]
  def change
    rename_column :entries, :user_id, :agent_id
    add_column :entries, :supplier_id, :integer
  end
end
