#START:validate
#START:select
#START:has_many
class Order < ActiveRecord::Base
#END:select
#END:validate
  has_many :line_items
  # ...
#END:has_many
#START:validate
  #START:select  
  PAYMENT_TYPES = [
     #  Displayed        stored in db
     [ "Chèque",          "check" ],
     [ "Carte bancaire",    "cc"   ],
     [ "Bon de commande", "po" ]
   ]

#END:validate
  # ...
  #END:select

  #START:validate
  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp, value| value}
  
  # ...
  #END:validate

  #START:add_line_items_from_cart
  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li      # <label id="code.p.append.li"/>
    end 
  end

  def self.pending_shipping
    find(:all, :conditions => "shipped_at is null")
  end
  def mark_as_shipped
    self.shipped_at = Time.now
  end
  def self.count_pending
    count "shipped_at is null"
  end

end
