require 'helper'

class TestJobartisCommon < Test::Unit::TestCase
  def test_format_email_address
    email = JobartisCommon::Contact::Email.new("maciej.lotkowski@jobartis.com", "Maciej Lotkowski")

    assert_equal "maciej.lotkowski@jobartis.com", "#{email}"
    assert_equal "Maciej Lotkowski <maciej.lotkowski@jobartis.com>", email.pretty
  end

  def test_format_phone_number
    phone = JobartisCommon::Contact::Phone.new("897174783")

    assert_equal "897174783", "#{phone}"
  end
end
