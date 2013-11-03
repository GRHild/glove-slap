class RemoveAvatarUrlAndFilepickerUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :filepicker_url, :string
    remove_column :users, :avatar_url, :string
  end
end
