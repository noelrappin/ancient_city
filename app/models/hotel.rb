class Hotel < ActiveRecord::Base
  belongs_to :trip
  monetize :price_cents
end
