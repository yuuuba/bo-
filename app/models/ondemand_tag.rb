class OndemandTag < ApplicationRecord
  has_many :ondemand_searches, dependent: :destroy, foreign_key: 'ondemand_tag_id'
  has_many :ondemands, through: :ondemand_searches
end
