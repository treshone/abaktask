class Page < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/ }
  validates :title, presence: true
  validates :content, presence: true
end
