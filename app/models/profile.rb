class Profile < ApplicationRecord
  belongs_to :portfolio

  has_one_attached :photo

  validates :title, :name, presence: true
  validates :photo, file: { max_size_in_bytes: 3000, mime_types: %i[jpg png] }

  def photo_url
    return "/assets/avatars/#{portfolio.temp_avatar}.png" unless photo.attached?

    Rails.application.routes.url_helpers.rails_blob_path(photo, only_path: true)
  end
end
