class CreateBlockchains < ActiveRecord::Migration[5.2]
  def change
    create_table :blockchains do |t|
      t.string :name

      t.timestamps
    end
  end
end
