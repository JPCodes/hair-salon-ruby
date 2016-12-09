require('spec_helper')

describe(Client) do

  describe('#initialize') do
    it ('returns attributes') do
      test_client = Client.new({:name => 'John Doe', :phone => '5551234444', :stylist_id => nil, :id => 1})
      expect(test_client.name()).to(eq('John Doe'))
      expect(test_client.phone()).to(eq('5551234444'))
    end
  end

  describe('#save') do
    it ('saves a client to the database') do
      test_client = Client.new({:name => 'Jane Doe', :phone => '4441235555', :stylist_id => 1, :id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it ('returns true when comparing two different objects with identical attributes') do
      test_client1 = Client.new({:name => 'Isaac Newton', :phone => '3235551234', :stylist_id => 2, :id => 1})
      test_client2 = Client.new({:name => 'Isaac Newton', :phone => '3235551234', :stylist_id => 2, :id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('.find') do
    it ('returns a client by ID') do
      test_client = Client.new({:name => 'Nicolaus Copernicus', :phone => '3235551234', :stylist_id => 2, :id => nil})
      test_client.save()
      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end

  describe('#update') do
    it ('updates a client') do
      test_client = Client.new({:name => 'Isaac Newton', :phone => '3235551234', :stylist_id => 2, :id => nil})
      test_client.save()
      test_client.update({:name => 'Marie Curie', :phone => '96'})
      expect(test_client.name()).to(eq('Marie Curie'))
      expect(test_client.phone()).to(eq('96'))
    end
  end


end
