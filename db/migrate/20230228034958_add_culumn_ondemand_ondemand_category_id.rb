class AddCulumnOndemandOndemandCategoryId < ActiveRecord::Migration[6.1]
  def change
    add_reference :ondemands, :ondemand_category, foreign_key: true
  end
end
