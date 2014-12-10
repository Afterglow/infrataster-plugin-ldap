require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def ldap(*args)
        Resources::LdapResource.new(*args)
      end
    end
  end
end
