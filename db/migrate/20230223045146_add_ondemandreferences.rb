class AddOndemandreferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :ondemands, :attitude, foreign_key: true
    add_reference :ondemands, :charm, foreign_key: true
    add_reference :ondemands, :detail, foreign_key: true
    add_reference :ondemands, :note, foreign_key: true
  end
end
