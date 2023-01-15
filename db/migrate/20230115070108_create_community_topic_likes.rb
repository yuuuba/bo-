class CreateCommunityTopicLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :community_topic_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community_topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
