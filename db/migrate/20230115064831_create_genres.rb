class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.references :community, null: false, foreign_key: true
      t.references :community_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
