class VoucherMailer < ApplicationMailer

  def voucher_mail(email, voucher)
    @email = email
    @url = "http://localhost:3001/"
    @voucher = voucher
    mail(to: @email, subject: "Your Voucher with ID: #{voucher.id}")
  end
end
