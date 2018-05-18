class RenameTablearticlesToArticles < ActiveRecord::Migration[5.2]
  def change
     rename_table :articles, :articles
  end
end
