module JobartisCommon
  module Contact
    module Candidates
      def email
        Email.new "support@jobartis.com", "Jobartis Support"
      end

      def phone
        Phone.new "996790419"
      end

      extend self
    end

    module Companies
      def email
        Email.new "info@jobartis.com", "Jobartis Support"
      end

      def phone
        Phone.new "929659742"
      end

      extend self
    end

    Phone = Struct.new(:number) do
      def pretty
        "(+244) #{ number.scan(/.{1,3}/).join(" ") }"
      end

      alias :to_s :number
    end

    Email = Struct.new(:address, :name) do
      def pretty
        "#{ name } <#{ address }>"
      end

      alias :to_s :address
    end
  end
end
