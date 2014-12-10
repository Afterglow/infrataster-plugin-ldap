require 'infrataster/rspec'
require 'infrataster-plugin-ldap'

Infrataster::Server.define(
  :master,
  '192.168.44.21',
  vagrant: true,
  ldap: { username: 'cn=admin,dc=localdomain', password: 'wibble!', basedn: 'dc=localdomain' }
)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
