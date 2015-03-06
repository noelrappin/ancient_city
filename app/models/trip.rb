class Trip < ActiveRecord::Base
  has_many :activities
  has_many :hotels

  monetize :price_cents

end
