class CreateSlaps < ActiveRecord::Migration
  def change
    create_table :slaps do |t|
      t.references :challenger, index: true
      t.references :target, index: true

      t.timestamps
    end
  end
end
