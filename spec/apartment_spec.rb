require 'spec_helper'

describe Apartment do
  it "should be valid" do
    Apartment.should be_a(Module)
  end

  it "should deprecate Apartment::Database in favor of Apartment::Tenant" do
    expect(Apartment::Database).to eq(Apartment::Tenant)
  end
end
