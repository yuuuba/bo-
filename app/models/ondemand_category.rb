class OndemandCategory < ApplicationRecord
  has_many :children, class_name: "OndemandCategory",
                      foreign_key: "parent_id"

  belongs_to :ondemand, class_name: "OndemandCategory", optional: true
end
