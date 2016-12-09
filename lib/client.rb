class Client
  attr_reader(:id, :name, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @id = attributes.fetch(:id)
  end

  # Create

  # Read

  # Update

  # Delete

end
