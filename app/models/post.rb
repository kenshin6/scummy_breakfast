class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images
  attr_accessor :image_data

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

  def slug_candidates
    [
      :title,
      [:title, :content]
    ]
  end

  def main_image
    images.where(main: true)
  end
end
