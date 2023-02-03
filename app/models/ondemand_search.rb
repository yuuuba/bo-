class OndemandSearch < ApplicationRecord
  belongs_to :ondemand
  belongs_to :ondemand_tag

  validates :ondemand_id, presence: true
  validates :ondemand_tag_id, presence: true
end
