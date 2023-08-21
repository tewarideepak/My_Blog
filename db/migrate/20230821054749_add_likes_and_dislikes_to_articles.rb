class AddLikesAndDislikesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :likes, :integer
    add_column :articles, :dislikes, :integer
  end
end
