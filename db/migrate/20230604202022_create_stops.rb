class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.string :ref

      t.timestamps
    end
  end
end
