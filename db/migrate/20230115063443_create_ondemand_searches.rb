class CreateOndemandSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :ondemand_searches do |t|
      t.references :ondemand, null: false, foreign_key: true
      t.references :ondemand_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
