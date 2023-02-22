# frozen_string_literal: true

RSpec.describe Boxcars::SQL do
  context "with sample helpdesk app" do
    boxcar = described_class.new

    it "can count comments from john" do
      VCR.use_cassette("sql") do
        expect(boxcar.run("how many comments are there from John?")).to eq("Answer: [{\"total_comments\"=>2}]")
      end
    end

    it "can find the last comment to the first post" do
      VCR.use_cassette("sql2") do
        expect(boxcar.run("What is the last comment for the first post?")).to include(" johns second ")
      end
    end
  end
end
