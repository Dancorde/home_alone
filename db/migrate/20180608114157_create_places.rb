class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.integer :numero
      t.float :latitude
      t.float :longitude
      t.string :descricao

      t.timestamps
    end
  end
end
