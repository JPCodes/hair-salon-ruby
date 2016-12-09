require('spec_helper')

describe(Stylist) do

  describe('#initialize') do
    it ('returns attributes') do
      test_stylist = Stylist.new({:id => nil, :name => 'John Doe'})
      expect(test_stylist.name()).to(eq('John Doe'))
    end
  end

  describe('#save') do
    it ('saves a stylist to the database') do
      test_stylist = Stylist.new({:id => nil, :name => 'Jane Doe'})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it ('returns true when comparing two different objects with identical attributes') do
      test_stylist1 = Stylist.new({:name => 'Jane Doe', :id => 1})
      test_stylist2 = Stylist.new({:name => 'Jane Doe', :id => 1})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

end
