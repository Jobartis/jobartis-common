module JobartisCommon
  module Contact
    PREFIX_FOR = {
      "AO" => "+244",
      "ZM" => "+260",
      "CM" => "+237"
    }

    PHONE_FOR_COMPANY_FROM = {
      "AO" => "225300180",
      "ZM" => "973332926",
      "CM" => "697281166"
    }



    module Candidate
      def email(tld = 'com')
        Email.new "info@jobartis.#{tld}", "Jobartis Support"
      end

      def phone
        Phone.new "996790419"
      end

      extend self
    end

    module Company
      def email(tld = 'com')
        Email.new "support@jobartis.#{tld}", "Jobartis Support"
      end

      def phone(country)
        code = country,code
        Phone.new JobartisCommon::Contact::PHONE_FOR_COMPANY_FROM[country.code],
                  JobartisCommon::Contact::PREFIX_FOR[country.code]
      end

      extend self
    end

    Phone = Struct.new(:number, :prefix) do
      def pretty
        "(#{prefix}) #{ number.scan(/.{1,3}/).join(" ") }"
      end

      alias :to_s :number
      alias :to_str :to_s
    end

    Email = Struct.new(:address, :name) do
      def pretty
        "#{ name } <#{ address }>"
      end

      alias :to_s :address
      alias :to_str :to_s
    end
  end
end
