require 'hanoi'

describe Hanoi do
  subject(:hanoi) {Hanoi.new}

  describe "#initialize" do
    it "sets up the towers to default" do
      expect(hanoi.towers).to eq([[3,2,1], [], []])
    end
  end

  describe "#move" do
    let(:towers) {Hanoi.new([[1],[2],[3]])}

    it "allows disk to be moved to an empty tower" do
      hanoi.move(0,2)
      expect(hanoi.towers).to eq([[3,2],[],[1]])
    end

    it "moves a smaller disk onto a larger disk" do
      towers.move(0,2)
      expect(towers.towers).to eq([[],[2],[3,1]])
    end

    it "doesn't allow a larger disk to be placed on a smaller disk" do
      expect do
        towers.move(1,0)
      end.to raise_error("cannot move onto a smaller disk")
    end

    it "doesn't allow to move from an empty tower" do
      expect do
        hanoi.move(1,2)
      end.to raise_error("cannot move from an empty tower")
    end
  end

  describe "#won?" do
    it "is not won at the start" do
      expect(hanoi.won?).to eq(false)
    end

    it "is won when all disks are moved to tower1 or tower2" do
      towers = Hanoi.new([[],[],[3,2,1]])
      expect(towers).to be_won
    end
  end

  describe "#render" do
    it "renders the default tower" do
      expect(hanoi.render).to eq("Tower 0: 3 2 1\nTower 1: \nTower 2: \n")
    end
  end
end
