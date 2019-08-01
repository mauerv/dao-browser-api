class CreateAuditors < ActiveRecord::Migration[5.2]
  def change
    create_table :auditors do |t|
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
