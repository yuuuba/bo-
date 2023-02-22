class CreateCharms < ActiveRecord::Migration[6.1]
  def change
    create_table :charms do |t|
      t.boolean :influential_person, default: false, null: false
      t.boolean :welcome_beginner, default: false, null: false
      t.text :body

      t.timestamps
    end
  end
end
