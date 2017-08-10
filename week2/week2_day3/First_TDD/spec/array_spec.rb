require 'array'

describe "#my_uniq" do
  let(:array) {[1,2,3,1,4,2]}
  let(:uniq_arr) {[1,2,3,4]}

  it "removes duplicates" do
    array.each do |el|
      expect(uniq_arr.count(el)).to eq(1)
    end
  end

  it "only contains items from the original array" do
    uniq_arr.each do |el|
      expect(array).to include(el)
    end
  end

  it "doesn't modify the original array" do
    expect {my_uniq(array)}.to_not change{array}
  end
end

describe "#two_sum" do
  let(:array) {[1,3,2,-2,4,-3]}
  let(:two_sum_array) {[[1,5], [2,3]]}

  it "finds zero sum pairs" do
    expect(two_sum(array)).to eq(two_sum_array)
  end
end

describe "#my_transpose" do
  let(:array) {[[1,2,3],
                [4,5,6],
                [7,8,9]]}
  let(:transposed_arr) {[[1,4,7],
                         [2,5,8],
                         [3,6,9]]}
  it "transposes an array" do
    expect(my_transpose(array)).to eq(transposed_arr)
  end
end

describe "#pick_stocks" do
  it "chooses a simple pair" do
    expect(pick_stocks([1,2,3,4,5])).to eq([0,4])
  end

  it "does not buy when prices are crashing" do
    expect(pick_stocks([5,4,3,2,1])).to be_nil
  end

  it "chooses the most profitable pair of days" do
    expect(pick_stocks([1,5,2,3,0,8])).to eq([4,5])
  end
end
