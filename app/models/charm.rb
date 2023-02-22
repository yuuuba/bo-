class Charm < ApplicationRecord
  belongs_to :ondemand, optional: true
end
