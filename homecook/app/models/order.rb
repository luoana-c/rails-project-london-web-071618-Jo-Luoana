class Order < ApplicationRecord
  has_many :order_recipes
  has_many :recipes, through: :order_recipes

  validates :datetime, presence: true

  # def order_date_cannot_be_in_the_past
  #   if self.datetime.present? && self.datetime < Date.today
  #     errors.add(:expiration_date, "can't be in the past")
  #   end
  # end

end
