require 'oystercard'

describe Oystercard do
  it 'has a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'adds an amount to a card balance' do
      amount = 30
      expect(subject.top_up(amount)).to eq 30
    end

    it "raises an error if card topped up more than £90" do
      expect { subject.top_up(Oystercard::LIMIT + 1) }.to raise_error "Card reached the £#{Oystercard::LIMIT} limit"
    end
  end

end
