class CreateCommunityTopicTags < ActiveRecord::Migration[6.1]
  def change
    create_table :community_topic_tags do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
