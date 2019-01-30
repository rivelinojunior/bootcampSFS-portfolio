class Social < ApplicationRecord
  belongs_to :portfolio

  enum kind: %i[facebook twitter linkedin github other instagram]
  validates :url, presence: true, http_url: true
end
