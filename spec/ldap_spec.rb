require 'spec_helper'

describe server(:master) do
  describe ldap("dc=localdomain") do
    it "accepts bind requests" do
      result = bind()
      expect(result['code']).to eq 0
    end
  end
end
