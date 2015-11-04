require 'test_helper'

class BookNotifierTest < ActionMailer::TestCase
  test "driverbooked" do
    mail = BookNotifier.driverbooked
    assert_equal "Driverbooked", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "hitcherbooked" do
    mail = BookNotifier.hitcherbooked
    assert_equal "Hitcherbooked", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
