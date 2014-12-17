# infrataster-plugin-ldap

LDAP plugin for [Infrataster](https://github.com/ryotarai/infrataster)

## Installation

Add this line to your Gemfile:

    gem 'infrataster-plugin-ldap'

And then add the following line to your spec\_helper.rb:

    require 'infrataster-plugin-ldap'

## Usage

```ruby
describe server(:master) do
  describe ldap("dc=mydomain,dc=com") do
    it "accepts bind requests" do
      expect(bind.code).to eq 0
    end
    it "can create a top level object" do
      result = add_result("dc=mydomain,dc=com",
                           {
                             :objectclass => [ "top", "dcObject", "organization"],
                             :o => "mydomain"
                           }
                         )
      expect(result.code).to eq 0
    end
  end
end
```

You can specify LDAP by options passed to `Infrataster::Server.define`:

```ruby
Infrataster::Server.define(
  # ...
  ldap: { basedn: "dc=mydomain,dc=com", username: "cn=admin,dc=mydomain,dc=com", password: "mypassword" }
)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/infrataster-plugin-ldap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
