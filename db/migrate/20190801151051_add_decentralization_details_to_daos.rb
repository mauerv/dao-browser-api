class AddDecentralizationDetailsToDaos < ActiveRecord::Migration[5.2]
  def change
    add_column :daos, :assets_governed, :text
    add_column :daos, :decentralization_level, :string
    add_column :daos, :centralization_points, :text
  end
end
