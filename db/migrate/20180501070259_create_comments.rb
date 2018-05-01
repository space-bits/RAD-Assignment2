class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :by
      t.text :text

      t.timestamps
    end
  end
end
