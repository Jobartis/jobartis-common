require 'helper'
require "ostruct"

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

  def test_bank_for_angola
    bank = JobartisCommon::Bank.new(angola_context).details

    assert_not_empty bank.name
    assert_not_empty bank.code
    assert_not_empty bank.number
    assert_not_empty bank.recipient
  end

  def test_bank_for_other_countries
    [drc_context, poland_context].each do |locale_context|
      bank = JobartisCommon::Bank.new(locale_context).details

      assert_not_empty bank.name
      assert_not_empty bank.code
      assert_not_empty bank.number
      assert_not_empty bank.recipient
    end
  end

  def angola_context
    OpenStruct.new(country: OpenStruct.new(code: "AO"))
  end

  def drc_context
    OpenStruct.new(country: OpenStruct.new(code: "CD"))
  end

  def poland_context
    OpenStruct.new(country: OpenStruct.new(code: "PL"))
  end
end
