require 'spec_helper'

describe Message do

  describe "email validation" do
    it { should validate_presence_of(:schedule_date) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:time_zone) }
  end

  describe "associations" do
    it { should have_many(:messages_contacts) }
    it { should have_many(:receivers).through(:messages_contacts) }
    it { should_not allow_value("Unknown").for(:time_zone) }
    it { should allow_value("New Delhi").for(:time_zone) }
  end

  describe "virtual attributes" do
    it {should respond_to(:receiver_tokens) }
  end

  describe "receiver_tokens="


  describe "delivered!"

  describe "have_receivers?"

end