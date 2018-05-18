class RenameColumnNewsIdOnTableComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :news_id, :article_id
  end
end
