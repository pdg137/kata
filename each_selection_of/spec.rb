require_relative 'kata'
require 'set'

describe "Array" do
  context "given an empty array" do
    a = []

    it "responds to each_selection_of with an enumerable" do
      a.should respond_to :each_selection_of
      a.each_selection_of(0).should be_a_kind_of Enumerable
    end

    it "can take a block argument" do
      called = false
      a.each_selection_of(0) do
        called = true
      end
      called.should == true
    end

    it "returns the right results when called with 0" do
      results = Set.new(a.each_selection_of(0))
      results.should == Set.new([[]])
    end

    it "returns the right results when called with 1" do
      results = Set.new(a.each_selection_of(1))
      results.should == Set.new([])
    end

    it "raises an exception when called with -1" do
      lambda { a.each_selection_of(-1) }.should raise_exception
    end
  end

  context "given an array with two elements" do
    a = [1,1]

    it "returns the single result when called with 2" do
      results = Set.new(a.each_selection_of(2))
      results.should == Set.new([[1,1]])
    end

    it "returns the two possibilities when called with 1" do
      results = Set.new(a.each_selection_of(1))
      results.should == Set.new([[1,0],[0,1]])
    end
  end

  context "given an array with three elements" do
    a = [1,2,3]

    it "returns the correct possibilities when called with 4" do
      results = Set.new(a.each_selection_of(4))
      results.should == Set.new([[1,2,1],[1,1,2],[1,0,3],[0,2,2],[0,1,3]])
    end
  end
end
