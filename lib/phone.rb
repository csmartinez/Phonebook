class Phone
  attr_reader(:phone_number, :phone_type)
  @@allnumbers = []

    define_method(:initialize) do |attributes|
      @phone_number = attributes.fetch(:phone_number)
      @phone_type = attributes.fetch(:phone_type)
      @id = @@allnumbers.length().+(1)
    end

    define_method(:id) do
       @id
     end

    define_singleton_method(:all) do
      @@allnumbers
    end

    define_method(:save) do
      @@allnumbers.push(self)
    end
  end
