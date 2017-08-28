class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images
  has_many :taggings
  has_many :tags, through: :taggings
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

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
