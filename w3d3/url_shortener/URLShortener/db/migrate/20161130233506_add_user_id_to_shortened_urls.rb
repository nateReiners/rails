class AddUserIdToShortenedUrls < ActiveRecord::Migration
  def change
    add_column :shortened_urls, :user_id, :integer
  end
end
