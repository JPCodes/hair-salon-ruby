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

  # Update
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  # Delete
  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    # Instead of removing the clients from the database, sets their stylist_id back to default 0 which indicates no stylist is assigned to the client
    DB.exec("UPDATE clients SET stylist_id = 0 WHERE stylist_id = #{self.id()}")
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
