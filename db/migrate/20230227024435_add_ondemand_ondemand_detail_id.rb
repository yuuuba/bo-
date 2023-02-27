class AddOndemandOndemandDetailId < ActiveRecord::Migration[6.1]
  def change
    add_reference :ondemands, :ondemand_detail, foreign_key: true
  end
end
