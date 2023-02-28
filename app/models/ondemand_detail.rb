class OndemandDetail < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }
  
  belongs_to :ondemand
end
