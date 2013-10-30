class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_id
      t.string :location
      t.string :nickname
      t.string :rank
      t.text :img

      t.timestamps
    end
  end
end
