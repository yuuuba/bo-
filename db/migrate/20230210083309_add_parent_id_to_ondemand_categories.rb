class AddParentIdToOndemandCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :ondemand_categories, :parent, foreign_key: { to_table: :ondemands }
  end
end
