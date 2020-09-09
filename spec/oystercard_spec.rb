require "oystercard"
require "journey"

describe Oystercard do

  let(:entry_station){ double :station }
  let(:exit_station) { double :station }

  it "has a default balance of 0" do
    expect(subject.balance).to eq 0
  end
  
  it "checks that the card has an empty list of journeys by default" do
  card = Oystercard.new(1)
  expect(card.list_of_journeys).to be_empty
  end

  it "touching in and out creates one journey" do
  card = Oystercard.new(1)
  card.touch_in(entry_station)
  card.touch_out(exit_station)
  expect(card.list_of_journeys).not_to be_empty
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

  describe "#touch_in" do
    it "sets the card status to be on a journey" do
      card = Oystercard.new(30)
      card.touch_in(entry_station)
      expect(card.in_journey?).to be true
    end

    it "raises an error after touch in method when balance is less than 1" do
      card = Oystercard.new(0)
      expect{card.touch_in(entry_station)}.to raise_error "Minimum amount to travel is £1"
    end 

    it "when card touches in record the entry point" do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
      end
  end

  describe "#touch_out" do
    it "sets the card status to NOT be on a journey" do
      card = Oystercard.new(30)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.in_journey?).to be false
    end

    it "will deduct minimum fare from the balance" do
      subject.top_up(1)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end

    it "will reset entry station to nil" do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it "when card touches in record the entry point" do
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
      end

    it "Entry and exit stations added to journey list" do
      card = Oystercard.new(10)
      card.touch_in("Kings Cross")
      expect(card.touch_out("Liverpool Street")).to eq([{"Kings Cross" => "Liverpool Street"}])
    end

  end

  
end
