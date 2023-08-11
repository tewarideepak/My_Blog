class AddLikesAndDislikesCountToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :likes_count, :integer
    add_column :articles, :dislikes_count, :integer
  end
end
