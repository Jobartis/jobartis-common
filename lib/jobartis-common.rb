module JobartisCommon
  class Bank
    DETAILS = Hash.new(
      recipient: "Jobartis Soluciones Web Africanas S.L.",
      number: "ES4201318933382717016740",
      code: "BESMESMM",
      name: "Banco Espirito Santo Spain"
    ).merge("AO" => {
      recipient: "SAGINV – SOCIEDADE ANGOLANA DE GEST INVEST LDA",
      number: "AO06 0045 0051 0001 2830 9674 5",
      code: "BESCAOLUXXX",
      name: "Banco Economico"
    })

    class Details
      attr_accessor :recipient, :number, :code, :name

      def initialize(recipient:, number:, code:, name:)
        self.recipient = recipient
        self.number = number
        self.code = code
        self.name = name
      end
    end

    attr_accessor :locale_context

    def initialize(locale_context)
      self.locale_context = locale_context
    end

    def details
      Details.new **DETAILS[locale_context.country.code]
    end
  end

  # TODO change the implementation, so it's JobartisCommon::Contact.new(country).company.email
  #
  module Contact
    PREFIX_FOR = {
      "AO" => "+244",
      "ZM" => "+260",
      "CM" => "+237",
      "PT" => "+351"
    }

    PHONE_FOR_COMPANY_FROM = {
      "AO" => "225300180",
      "ZM" => "973332926",
      "CM" => "697281166",
      "PT" => "916673164"
    }

    module Candidate
      def email(domain)
        Email.new "info@#{domain}", "Jobartis Support"
      end

      def phone?(country)
        country.code == "AO"
      end

      def phone
        Phone.new "996790419"
      end

      extend self
    end

    module Company
      def email(domain)
        Email.new "support@#{domain}", "Jobartis Support"
      end

      def phone?(country)
        PHONE_FOR_COMPANY_FROM.has_key? country.code
      end

      def phone(country)
        code = country.code

        Phone.new JobartisCommon::Contact::PHONE_FOR_COMPANY_FROM[code],
                  JobartisCommon::Contact::PREFIX_FOR[code]
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
