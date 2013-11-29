#START:has_many
class Product < ActiveRecord::Base
  has_many :line_items
  # ...
#END:has_many
  
  def self.find_products_for_sale
    find(:all, :order => "title")
  end
  

  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validates_uniqueness_of :title
  validates_format_of :image_url, 
                      :with    => %r{\.(gif|jpg|png)$}i,
                      :message => "doit être une URL pour une image au format GIF, JPG ou PNG"
  protected

  def validate
    errors.add(:price, "doit être au moins 0.01") if price.nil? ||  price < 0.01
  end
#START:has_many
end
#END:has_many

