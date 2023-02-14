class RemoveBodyFromOndemandTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :ondemand_tags, :body, :text
  end
end
