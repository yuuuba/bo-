class AddOndemandDetailcolumnplace < ActiveRecord::Migration[6.1]
  def change
    add_column :ondemand_details, :place, :string
  end
end
