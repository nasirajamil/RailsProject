class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      #rename_column :articles, :ARticles_count, :comments_count
      remove_column :articles, ARticles_count, dependent: :destroy
      t.timestamps
    end
  end
end
