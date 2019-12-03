class Wallet < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, unless: :price?

end
