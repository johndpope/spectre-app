class UserMailer < ActionMailer::Base
  default from: "notifications@spectredemo.com"

  def case_generated(user, case_info)
    @user = user
    @case = case_info
    @url = "http://spectredemo.herokuapp.com"
    mail(:to => user.email, :subject => "Compliance incident detected")
  end
end
