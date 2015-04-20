class Book < ActiveRecord::Base
  # Sorts Book lists by title
  # default_scope :order => "title"
  has_many :line_items
  has_many :recommendations

  # Callbacks
  before_destroy :ensure_not_referenced_by_any_line_items
  before_destroy :ensure_not_referenced_by_any_recommendations

  # Simple validation of data
  validates_presence_of :asin
  validates_presence_of :title

  validates_uniqueness_of :asin, :message => "ASIN must be unique"

  validates_format_of :image_url,
                      :with    => %r{\.(gif|jpg|png)$}i,
                      :message => "must be a URL for a GIF, JPG, or PNG image"

  private

    # ensures no line items referencing this product
    def ensure_not_referenced_by_any_line_items
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items Present')
        return false
      end
    end

    # ensures no recommendations referencing this product
    def ensure_not_referenced_by_any_recommendations
      if recommendations.empty?
        return true
      else
        errors.add(:base, 'Recommendations Present')
        return false
      end
    end
end
