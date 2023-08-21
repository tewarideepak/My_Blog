class RemoveColumnNameFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :likes, :integer
    remove_column :articles, :dislikes, :integer
    remove_column :articles, :likes_count, :integer
    remove_column :articles, :dislikes_count, :integer
  end
end
