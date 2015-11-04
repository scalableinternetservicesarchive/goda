# Preview all emails at http://localhost:3000/rails/mailers/book_notifier
class BookNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/book_notifier/driverbooked
  def driverbooked
    BookNotifier.driverbooked
  end

  # Preview this email at http://localhost:3000/rails/mailers/book_notifier/hitcherbooked
  def hitcherbooked
    BookNotifier.hitcherbooked
  end

end
