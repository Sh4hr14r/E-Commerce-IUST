class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :income, :manufacturer, :name, :price, :sold, :stock
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line_items present')
      return false
    end
  end

  validates :name , :description, :image_url, :manufacturer, :price, :stock, :presence => true
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates_numericality_of :stock, :greater_than_or_equal_to => 0
  validates_uniqueness_of :name
  validates_format_of :image_url, :with => %r{\.(gif|png|jpg)$}i, :message => "Must be a url for an image in one of the
following formats: GIF,JPG or PNG"
  default_scope :order => "updated_at"
end
