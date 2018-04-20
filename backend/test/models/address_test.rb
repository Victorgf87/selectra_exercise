require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "test allows null coverage type" do
    address=Address.new(address: "Calle Rafael Herrero 42, Madrid", user: User.first)
    assert address.save
  end

  test "test must not save without user" do
    address=Address.new(address: "Calle Rafael Herrero 42, Madrid")
    assert_not address.save
  end

  test "must fail if address already exists" do
    address=Address.new(address: "Calle Rafael Herrero 4, Madrid")
    assert_not address.save
  end
end
