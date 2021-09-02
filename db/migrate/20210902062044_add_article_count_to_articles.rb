class AddArticleCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :ARticles_count, :integer
  end
end
