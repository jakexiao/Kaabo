class AddImageUrltoArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image_url, :string
  end
end
