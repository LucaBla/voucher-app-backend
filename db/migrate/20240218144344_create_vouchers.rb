class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.date :expiry_date
      t.decimal :value
      t.enum :status, enum_name: 'voucher_status', enum_type: 'integer'
      t.references :business, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
