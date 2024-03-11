class CreateRetrievedArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :retrieved_articles do |t|

      t.timestamps
    end
  end
end
