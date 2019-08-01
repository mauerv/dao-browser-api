class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :url
      t.belongs_to :dao, foreign_key: true

      t.timestamps
    end
  end
end
