require "spec_helper"

RSpec.describe Sendable do
  it "has a version number" do
    expect(Sendable::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
