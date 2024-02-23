class Unit < ApplicationRecord
  belongs_to :business
  has_many :vouchers

  validates :name, presence: true
end
