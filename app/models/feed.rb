class Feed < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  scope :recent, -> { order(created_at: :desc) }
end
