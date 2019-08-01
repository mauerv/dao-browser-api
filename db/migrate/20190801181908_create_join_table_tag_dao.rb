class CreateJoinTableTagDao < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :daos do |t|
      t.index [:tag_id, :dao_id]
      t.index [:dao_id, :tag_id]
    end
  end
end
