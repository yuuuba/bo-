class Ondemand < ApplicationRecord
  belongs_to :user
  has_many :ondemand_searches, dependent: :destroy
  has_many :ondemand_tags, through: :ondemand_searches
  has_many_attached :images

  def save_tag(sent_tags)
    current_tags = self.ondemand_tags.pluck(:name) unless self.ondemand_tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.ondemand_tags.delete OndemandTag.find_by(name: old)
    end

    new_tags.each do |new|
      new_ondemand_tag = OndemandTag.find_or_create_by(name: new)
      self.ondemand_tags << new_ondemand_tag
    end
  end
end