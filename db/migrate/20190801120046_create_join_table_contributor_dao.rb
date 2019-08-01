class CreateJoinTableContributorDao < ActiveRecord::Migration[5.2]
  def change
    create_join_table :contributors, :daos do |t|
      # t.index [:contributor_id, :dao_id]
      t.index [:dao_id, :contributor_id]
    end
  end
end
