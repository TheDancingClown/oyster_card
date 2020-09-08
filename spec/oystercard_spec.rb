require "oystercard"

describe Oystercard do
  it "has a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it "adds an amount to a card balance" do
      amount = 30
      expect(subject.top_up(amount)).to eq 30
    end

    it "raises an error if card topped up more than GBP90" do
      expect { subject.top_up(Oystercard::LIMIT + 1) }.to raise_error "Card reached the GBP#{Oystercard::LIMIT} limit"
    end
  end

  describe "#deduct" do
    it "deducts a specified amount" do
      card = Oystercard.new(30)
      expect(card.deduct(5)).to eq 25
    end
  end

  describe "#touch_in" do
    it "sets the card status to be on a journey" do
      card = Oystercard.new(30)
      card.touch_in
      expect(card.in_journey?).to be true
    end
  end

  describe "#touch_out" do
    it "sets the card status to NOT be on a journey" do
      card = Oystercard.new(30)
      card.touch_out
      expect(card.in_journey?).to be false
    end

    it "raises an error after touch in method when balance is less than 1" do
      card = Oystercard.new(0)
      expect{card.touch_in}.to raise_error "Minimum amount to travel is £1"

    end 

  end
end
