require 'spec_helper'

describe Contact do

  describe "email validation" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { should have_many(:messages_contacts) }
    it { should have_many(:messages).through(:messages_contacts) }
    it { should_not allow_value("test@test").for(:email) }
    it { should allow_value("sachin.y87@gmail.com").for(:email) }
  end


  # def self.ids_from_tokens(tokens)
  #   tokens.gsub!(/<<<(.+?)>>>/) { create!(email: $1).id }
  #   tokens.split(',')
  # end


  describe "Contact.tokens" do
    context "email found" do
      it "should return an array" do
        FactoryGirl.create(:contact, email: 'sachin@gmail.com')
        expect(Contact.tokens("sac")).to eq([{:id=>1, :name=>"sachin@gmail.com"}])
      end
    end

    context "no email found" do
      it "should return an empty array" do
        FactoryGirl.create(:contact, email: 'admin@gmail.com')
        expect(Contact.tokens("super")).to eq([])
      end
    end
  end

  describe "Contact.ids_from_tokens" do
    context "create new contact with given email" do
       pending
    end
  end

end