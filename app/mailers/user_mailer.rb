class UserMailer < ActionMailer::Base
  default from: "Consoom (hello@consoom.net)"

  def invite_email(invite)
    @invite = invite
    @url = "http://consoom.net/users/sign_up"
    mail(:to => invite.invitee_email,
         :subject => "#{@invite.inviter.first} #{@invite.inviter.last} has invited you to Consoom")
  end

  def invite_accepted_email(invite)
    @invite = invite
    @url = "http://consoom.net/"
    mail(:to => invite.inviter.email,
         :subject => "#{@invite.invitee.first} #{@invite.invitee.last} has accepted your invitation to join Consoom")
  end

  def request_notification_email(recommendation_request)
    @recommendation_request = recommendation_request
    @url = "http://consoom.net/recommendations/new?id=#{@recommendation_request.id}"
    mail(:to => recommendation_request.recommender_user.email,
         :subject => "#{@recommendation_request.requestor_user.first} #{@recommendation_request.requestor_user.last} has requested a recommendation from you")
  end

  def recommendation_notification_email(recommendation)
    @recommendation = recommendation
    @url = "http://consoom.net/recommendations/#{@recommendation.id}"
    mail(:to => recommendation.requestor_user.email,
         :subject => "#{@recommendation.recommender_user.first} #{@recommendation.recommender_user.last} has recommended a book for you.")
  end

end
