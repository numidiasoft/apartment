require 'spec_helper'

describe Apartment do
  it "should be valid" do
    Apartment.should be_a(Module)
  end

  it "should deprecate Apartment::Database in favor of Apartment::Tenant" do
    expect(Apartment::Database).to eq(Apartment::Tenant)
  end

  it "should set the default value" do
    expect(Apartment.load_database_file_schema).to be(true)
    expect(Apartment.migrations_paths[0]).to eq("db/migrate")
  end

  it "should set migrations_paths" do
    Apartment.migrations_paths = ["db/migration"]
    expect(Apartment.migrations_paths.first).to eq("db/migration")
  end
end
