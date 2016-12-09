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

  describe('.find') do
    it ('returns a stylist by ID') do
      test_stylist = Stylist.new({:id => nil, :name => 'Hair McCutter'})
      test_stylist.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#update') do
    it ('updates a stylist') do
      test_stylist = Stylist.new({:id => nil, :name => 'Hair McCutter'})
      test_stylist.save()
      test_stylist.update({:name => 'Cutter McHair'})
      expect(test_stylist.name()).to(eq('Cutter McHair'))
    end
  end

  describe('#delete') do
    it('deletes a stylist from the database') do
      stylist1 = Stylist.new({:id => nil, :name => 'Cutty McCuts-a-lot'})
      stylist1.save()
      stylist2 = Stylist.new({:id => nil, :name => "Non-descript hair stylist that no one is sure actually works there and the manager doesnt remember hiring but everyone plays along because hes a nice dude"})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

end
