class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :url
      t.date :date
      t.belongs_to :dao, foreign_key: true

      t.timestamps
    end
  end
end
