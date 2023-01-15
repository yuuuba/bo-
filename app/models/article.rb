class Article < ApplicationRecord
  belongs_to :community_topic
  belongs_to :community_topic_tag
end
