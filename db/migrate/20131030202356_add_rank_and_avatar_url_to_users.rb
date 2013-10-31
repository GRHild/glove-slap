class AddRankAndAvatarUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rank, :integer
    add_column :users, :avatar_url, :string
  end
end
