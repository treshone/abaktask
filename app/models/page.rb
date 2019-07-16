class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_ancestry

  validates :name, presence: true, format: { with: /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/ }
  validates :title, presence: true
  validates :content, presence: true

  after_save :update_descendants_slugs

  def should_generate_new_friendly_id?
    name_changed?
  end

  private

  def update_descendants_slugs
    if has_children?
      descendants.each do |subpage|
        subpage.slug = [subpage.parent.slug, subpage.slug.split('/').last].join('/')
        subpage.save!
      end
    end
  end

  def add_parent_slug(slug_name)
    if has_parent?
      slug = [parent.slug, slug_name].join('/')
    else
      slug = slug_name
    end
  end
end
