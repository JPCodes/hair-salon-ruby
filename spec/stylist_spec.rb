require('spec_helper')

describe(Stylist) do

  describe('#initialize') do
    it ('returns attributes') do
      test_stylist = Stylist.new({:id => nil, :name => 'John Doe'})
      expect(test_stylist.name()).to(eq('John Doe'))
    end
  end

end
