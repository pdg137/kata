require_relative 'kata'
require 'set'

# Goal: make a method that allows us to find all of the possible
# selections from an array.
# For example:
# [1,2,3].each_selection_of(4)
# [1,2,1] [1,1,2], [0,2,2], [0,1,3], [1,0,3]

describe "Array" do
  it "has a method called each_selection_of" do
    [1,2,3].should respond_to :each_selection_of
    [1,2,3].each_selection_of(4).should be_a_kind_of Enumerable
  end

  it "responds correctly to simple cases" do
    [].each_selection_of(0).to_a.should == [ [] ]
    [].each_selection_of(1).to_a.should == [ ]
    [1].each_selection_of(1).to_a.should == [ [1] ]
    [1].each_selection_of(0).to_a.should == [ [0] ]
    [1].each_selection_of(2).to_a.should == [ ]
  end

  it "responds correctly to more complicated cases" do
    Set.new([1,1].each_selection_of(1)).should == Set.new([ [1,0], [0,1] ])
    Set.new([1,2,3].each_selection_of(4)).should == Set.new([ [1,2,1], [1,1,2], [0,2,2], [0,1,3], [1,0,3] ])
    Set.new([3,4,5].each_selection_of(2)).should ==
      Set.new([ [2,0,0], [1,1,0], [1,0,1],
                [0,1,1], [0,2,0], [0,0,2] ])
    Set.new([3,4,5].each_selection_of(9)).should ==
      Set.new([ [3,4,2], [3,3,3], [3,2,4], [3,1,5],
                [2,4,3], [2,3,4], [2,2,5],
                [1,4,4], [1,3,5],
                [0,4,5]
                ])
  end
end
