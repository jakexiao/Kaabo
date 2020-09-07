class RemoveUpvotesFromThemes < ActiveRecord::Migration[6.0]
  def change
    remove_column :themes, :upvotes, :integer
  end
end
