class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title, :make_slug

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def make_slug
    self.slug = self.title.downcase.gsub(/[^a-z\s]/,'').gsub(" ", '-')
  end
end