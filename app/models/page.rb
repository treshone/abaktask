class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_ancestry

  validates :name, presence: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/ }
  validates :title, presence: true
  validates :content, presence: true
end
