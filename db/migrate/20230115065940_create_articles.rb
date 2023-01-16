class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :community_topic, null: false, foreign_key: true
      t.references :community_topic_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
