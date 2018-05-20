class RemoveTextFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :text, :string
  end
end
