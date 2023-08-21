class AddUserAndArticleToDislikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :dislikes, :user, null: false, foreign_key: true
    add_reference :dislikes, :article, null: false, foreign_key: true
  end
end
