require 'test_helper'

class OrderNotifierMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifierMailer.received(orders(:one))
    assert_equal "Подтверждение заказа в Pragmatic Store", mail.subject
    assert_equal ["dave@exapmle.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    # assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifierMailer.shipped(orders(:one))
    assert_equal "Заказ из Pragmatic Store отправлен", mail.subject
    assert_equal ["dave@exapmle.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    # assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
    mail.body.encoded
  end

end
