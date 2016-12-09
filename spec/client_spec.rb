require('spec_helper')

describe(Client) do

  describe('#initialize') do
    it ('returns attributes') do
      test_client = Client.new({:name => 'John Doe', :phone => '5551234444', :stylist_id => nil})
      expect(test_client.name()).to(eq('John Doe'))
      expect(test_client.phone()).to(eq('5551234444'))
    end
  end

end
