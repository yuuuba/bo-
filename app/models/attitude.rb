class Attitude < ApplicationRecord
  belongs_to :ondemand, optional: true
end
