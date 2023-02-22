class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :minimum_requirement
      t.text :prohibited

      t.timestamps
    end
  end
end
