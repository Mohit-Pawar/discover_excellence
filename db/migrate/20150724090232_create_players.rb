class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :info

      t.timestamps null: false
    end
  end
end
