require_relative 'kata'

describe "Array" do
  context "given an array with two elements" do
    a = [1]

    it "responds to each_selection_of" do
      a.should respond_to :each_selection_of
    end
  end
end
