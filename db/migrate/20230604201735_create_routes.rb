class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :from
      t.string :to
      t.string :route
      t.string :ref
      t.string :colour
      t.string :network
      t.string :operator
      t.string :website

      t.timestamps
    end
  end
end
