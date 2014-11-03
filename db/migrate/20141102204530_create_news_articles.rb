class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :heading
      t.text :body

      t.timestamps
    end
  end
end
