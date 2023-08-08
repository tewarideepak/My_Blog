class AddAuthorAndCommentsCounterToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, foreign_key: { to_table: 'users' }
    add_column :articles, :comments_counter, :integer, default: 0
  end
end
