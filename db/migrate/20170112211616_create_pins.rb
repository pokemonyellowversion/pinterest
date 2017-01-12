class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.text :description
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
