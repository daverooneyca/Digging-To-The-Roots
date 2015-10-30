class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username
      t.string :name
      t.integer :age
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
