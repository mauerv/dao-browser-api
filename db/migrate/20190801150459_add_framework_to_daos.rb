class AddFrameworkToDaos < ActiveRecord::Migration[5.2]
  def change
    add_reference :daos, :framework, foreign_key: true
  end
end
