class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :by
      t.text :text
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
