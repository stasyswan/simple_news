class CreateNewsArticleTags < ActiveRecord::Migration
  def change
    create_table :news_article_tags do |t|
      t.references :news_article
      t.references :tag

      t.timestamps
    end
    add_index :news_article_tags, :news_article_id
    add_index :news_article_tags, :tag_id
  end
end
