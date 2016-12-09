class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  # Create
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  # Read
  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new({:id => id, :name => name}))
    end
    stylists
  end

  # Find by ID
  define_singleton_method(:find) do |id_num|
    returned_stylists = Stylist.all()
    found_stylist = nil
    returned_stylists.each() do |stylist|
      if stylist.id() == id_num
        found_stylist = stylist
      end
    end
    found_stylist
  end

  # Double equals modify for RSpec
  define_method(:==) do |other_stylist|
    self.name().==(other_stylist.name()).&(self.id().==(other_stylist.id()))
  end

end
