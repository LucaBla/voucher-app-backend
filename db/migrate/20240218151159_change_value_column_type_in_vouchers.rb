class ChangeValueColumnTypeInVouchers < ActiveRecord::Migration[7.0]
  def change
    change_column :vouchers, :value, :integer
  end
end
