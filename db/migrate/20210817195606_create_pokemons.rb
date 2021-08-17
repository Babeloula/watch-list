class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type_one
      t.string :type_two

      t.timestamps
    end
  end
end
