class AddStatusToDaos < ActiveRecord::Migration[5.2]
  def change
    add_reference :daos, :status, foreign_key: true
  end
end
