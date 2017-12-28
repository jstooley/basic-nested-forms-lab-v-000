class Recipe < ActiveRecord::Base
  has_many :ingredients

  def ingredient_name
  end
end
