class AddStatusToSlaps < ActiveRecord::Migration
  def change
    add_column :slaps, :status, :string, :default => "pending"
  end
end
