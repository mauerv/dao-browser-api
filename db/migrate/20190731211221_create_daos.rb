class CreateDaos < ActiveRecord::Migration[5.2]
  def change
    create_table :daos do |t|
      t.string :name
      t.string :subtitle
      t.string :description
      t.string :website
      t.string :contract_proof
      t.string :mail
      t.string :github
      t.string :twitter
      t.string :medium
      t.string :telegram
      t.string :reddit
      t.string :discord

      t.timestamps
    end
  end
end
