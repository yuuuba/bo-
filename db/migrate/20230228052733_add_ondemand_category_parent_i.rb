class AddOndemandCategoryParentI < ActiveRecord::Migration[6.1]
  def change
    add_reference :ondemand_categories, :parent, foreign_key: { to_table: :ondemand_categories }
  end
end
