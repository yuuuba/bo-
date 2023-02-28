class RemoveOndemandCategoryParent < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :ondemand_categories, :ondemands, column: :parent_id
    remove_index :ondemand_categories, :parent_id
    remove_column :ondemand_categories, :parent_id, :bigint
  end
end
