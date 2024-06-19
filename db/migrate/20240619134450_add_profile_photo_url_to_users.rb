class AddProfilePhotoUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_photo_url, :string
  end
end
