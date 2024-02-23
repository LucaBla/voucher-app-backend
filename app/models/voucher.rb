class Voucher < ApplicationRecord
  enum status: [:active, :inactive]

  belongs_to :business
  belongs_to :unit

  validates :expiry_date, presence: true
  validates :value, presence: true
  validates :status, presence: true
end
