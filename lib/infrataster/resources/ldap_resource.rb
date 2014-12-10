require 'infrataster'

module Infrataster
  module Resources
    class LdapResource < BaseResource
      Error = Class.new(StandardError)

      attr_reader :basedn

      def initialize(basedn)
        @basedn = basedn
      end

      def to_s
        "LDAP: #{@basedn}"
      end
    end
  end
end
