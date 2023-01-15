class CreateOndemandReals < ActiveRecord::Migration[6.1]
  def change
    create_table :ondemand_reals do |t|
      t.string :title
      t.text :body
      t.references :ondemand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
