class Genre < ApplicationRecord
  belongs_to :community
  belongs_to :community_tag
end
