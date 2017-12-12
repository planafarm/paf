class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :user, null: false
      t.string :index, null: false
      t.json :data, null: false
      t.string :sector
      t.string :sub_sector
      t.string :family
      t.string :product

      t.timestamps
    end
  end
end
