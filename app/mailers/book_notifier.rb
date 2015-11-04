class BookNotifier < ApplicationMailer
default from: 'GODa <goda.noreply@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_notifier.driverbooked.subject
  #
  def driverbooked(ride)
    @ride = ride
      mail(to: ride.driver.user.email,
         subject: 'Your driver post has been booked') do |format|
      format.text { render 'driverbooked'}
      # mail(to: ride.driver.user.email,
      #    subject: 'Your driver post has been booked') 
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_notifier.hitcherbooked.subject
  #
  def hitcherbooked(take)

    @take = take
    mail(to: take.hitcher.user.email,
         subject: 'Your hitcher post has been booked') do |format|
      format.text { render 'hitcherbooked'}
    end
  end
end
