class MutualSettlementRequestMailer < ApplicationMailer
  def inform_admin_mutual_settlement(user, message)
    @user_name = Spree::User.find(user).full_name
    @message = message
    mail(to: "kinzhuvatova@gmail.com", from: "videoko2016@gmail.com", subject: "")
  end
end
