class Post < ApplicationRecord
  extend FriendlyId
  mount_uploader :image, ImageUploader

  friendly_id :title, use: :slugged

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

  def slug_candidates
    [
      :title,
      [:title, :content]
    ]
  end
end
