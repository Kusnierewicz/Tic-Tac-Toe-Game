require "spec_helper.rb"

describe Array do
  context "#all_empty?" do
  	it "returns true if all elements of Array are empty" do
  	  expect(["", "", ""].all_empty?).to eq true
  	end

  	it "returns false if some of the Array elements are not empty" do
  	  expect(["", 1, "", Object.new, :a].all_empty?).to eq false
  	end

  	it "returns true foe an empty Array" do
  	  expect([].all_empty?).to eq true
  	end
  end

  context "#all_same?" do
    it "returns true if all elements of Array are the same" do
      expect(["A", "A", "A"].all_same?).to eq true
    end

    it "returns false if some of the Array elements are not the same" do
      expect(["", 1, "", Object.new, :a].all_same?).to eq false
    end

    it "returns true for an the same Array" do
      expect([].all_same?).to eq true
    end
  end

end