class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :descricao

      t.timestamps
    end
  end
end
