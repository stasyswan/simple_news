class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :news_article

      t.timestamps
    end
    add_index :tags, :news_article_id
  end
end
