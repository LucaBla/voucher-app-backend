class Voucher < ApplicationRecord
  before_create :generate_unique_id

  enum status: [:active, :inactive]

  belongs_to :business
  belongs_to :unit

  #validates :expiry_date, presence: true
  validates :value, presence: true
  validates :status, presence: true

  private

  def generate_unique_id
    loop do
      self.id = SecureRandom.uuid
      break unless self.class.exists?(id: self.id)
    end
  end
end
