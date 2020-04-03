class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2, default: 0
      t.string :author
      t.references :genre, foreign_key: true, index: true

      t.timestamps
    end
  end
end
