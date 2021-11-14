class Gamepost < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 30 }
  validates :developer, presence: true, length: { maximum: 30 }
  validates :distributor, presence: true, length: { maximum: 30 }
  validates :platform, presence: true, length: { maximum: 10 }
  validates :releasedate, presence: true, length: { maximum: 10 }
  validates :playdate, presence: true, length: { maximum: 10 }
  validates :registrationdate, presence: true, length: { maximum: 10 }
  validates :updatedate, presence: true, length: { maximum: 10 }
end
