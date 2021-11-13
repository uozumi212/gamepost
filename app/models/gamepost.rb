class Gamepost < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :developer, presence: true, length: { maximum: 255 }
  validates :distributor, presence: true, length: { maximum: 255 }
  validates :platform, presence: true, length: { maximum: 255 }
  validates :releasedate, presence: true, length: { maximum: 255 }
  validates :playdate, presence: true, length: { maximum: 255 }
  validates :registrationdate, presence: true, length: { maximum: 255 }
  validates :updatedate, presence: true, length: { maximum: 255 }
end
