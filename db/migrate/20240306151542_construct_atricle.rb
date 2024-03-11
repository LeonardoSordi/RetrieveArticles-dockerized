class ConstructAtricle < ActiveRecord::Migration[7.1]
  def change
    add_column :retrieved_articles, :body, :string
    add_column :retrieved_articles, :title, :string
  end
end
