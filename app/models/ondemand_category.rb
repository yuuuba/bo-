class OndemandCategory < ApplicationRecord
  has_many :children, class_name: "OndemandCategory",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "OndemandCategory", optional: true
  has_one :ondemand


  scope :root_categories, -> { where(parent_id: [nil, '']) }

  class << self
    def to_group
      hash_grouped_categories =
        root_categories.map do |root_category|
          {
            # to_sym を使う場合は 読み出し時、「hash["スポーツ".to_sym]」のように書く
            root_category.name.to_sym => root_category.children.map(&:name)
          }
        end

      hash_grouped_categories.reduce({}) { |ret, hash| ret.merge(hash) }
    end
  end
end
