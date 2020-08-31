class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :content
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
