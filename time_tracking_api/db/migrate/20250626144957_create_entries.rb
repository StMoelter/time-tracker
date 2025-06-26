class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.integer :duration
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
