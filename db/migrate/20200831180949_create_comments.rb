class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.date :date
      t.text :content
      t.integer :upvote
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
