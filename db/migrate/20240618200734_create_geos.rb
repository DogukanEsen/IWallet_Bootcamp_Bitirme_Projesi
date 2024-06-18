class CreateGeos < ActiveRecord::Migration[7.1]
  def change
    create_table :geos do |t|
      t.float :lat
      t.float :lng
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
