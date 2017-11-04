class CreateCategoriesPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_posts do |t|
      t.references :post, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
