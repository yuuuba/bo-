class CreateAttitudes < ActiveRecord::Migration[6.1]
  def change
    create_table :attitudes do |t|
      t.boolean :serious, default: false, null: false
      t.boolean :loose, default: false, null: false

      t.timestamps
    end
  end
end
