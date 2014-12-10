require 'infrataster'
require 'net-ldap'

module Infrataster
  module Contexts
    class LdapContext < BaseContext
      def bind

        # Default options
        options = { port: 389,
                    username: '',
                    password: '',
                    basedn: 'dc=example,dc=com'
        }
        options = options.merge(server.options[:ldap]) if server.options[:ldap]

        server.forward_port(options[:port]) do |address, new_port|
          ldap = Net::LDAP.new(
            :host => server.address,
            :port => new_port,
            :auth => {
              :method => :simple,
              :username => options[:username],
              :password => options[:password]
            }
          )
          ldap.bind
          
          puts ldap.get_operation_result
          return ldap.get_operation_result
#          r = ldap.search(
#            :base => options[:basedn],
#            :filter => options[:filter]
#          )
        end
      end
    end
  end
end
