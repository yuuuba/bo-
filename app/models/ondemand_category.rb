class OndemandCategory < ApplicationRecord
  has_many :children, class_name: "OndemandCategory",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "OndemandCategory", optional: true

  scope :root_categories, -> { where(parent_id: [nil, '']) }

  class << self
    def to_group
      hash_grouped_categories =
        root_categories.map do |root_category|
          {
            root_category.name.to_sym => root_category.children.map(&:name)
          }
        end

      hash_grouped_categories.reduce({}) { |ret, hash| ret.merge(hash) }
    end
  end
end
