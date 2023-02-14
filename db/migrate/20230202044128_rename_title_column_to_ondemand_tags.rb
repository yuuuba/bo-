class RenameTitleColumnToOndemandTags < ActiveRecord::Migration[6.1]
  def change
    rename_column :ondemand_tags, :title, :name
  end
end