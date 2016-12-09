class Client
  attr_reader(:id, :name, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  # Create

  # Read

  # Update

  # Delete

end
