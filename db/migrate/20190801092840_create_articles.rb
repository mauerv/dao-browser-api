class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.date :date
      t.references :dao, foreign_key: true

      t.timestamps
    end
  end
end
