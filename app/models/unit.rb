class Unit < ApplicationRecord
  belongs_to :business
  has_many :vouchers

  validates :name, presence: true

  before_destroy :destroy_related_vouchers

  private

  def destroy_related_vouchers
    self.vouchers.destroy_all
  end
end
