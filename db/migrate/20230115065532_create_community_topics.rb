class CreateCommunityTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :community_topics do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
