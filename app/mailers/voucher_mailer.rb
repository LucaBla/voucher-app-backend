class VoucherMailer < ApplicationMailer

  def voucher_mail(email, voucher)
    @email = email
    @url = ENV["FRONTEND_URL"]
    @voucher = voucher
    mail(to: @email, subject: "Your Voucher with ID: #{voucher.id}")
  end
end
