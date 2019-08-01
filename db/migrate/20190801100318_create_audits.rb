class CreateAudits < ActiveRecord::Migration[5.2]
  def change
    create_table :audits do |t|
      t.string :url
      t.date :date
      t.belongs_to :auditor, foreign_key: true
      t.belongs_to :dao, foreign_key: true

      t.timestamps
    end
  end
end
