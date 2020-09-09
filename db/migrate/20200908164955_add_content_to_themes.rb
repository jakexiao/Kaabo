class AddContentToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :content, :text
  end
end
