class ChangePrimaryKeyInVouchersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :vouchers, :id, :string
  end
end
