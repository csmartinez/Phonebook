class Phone
  attr_reader(:morenumbers, :phonetype)
  @@allnumbers = []

    define_method(:initialize) do |attributes|
      @morenumbers = attributes.fetch(:morenumbers)
      @phonetype = attributes.fetch(:phonetype)
      @phones = []
    end

    define_singleton_method(:all) do
      @@allnumbers
    end

    define_method(:save) do
      @@allnumbers.push(self)
    end

    define_method(:phones) do
      @phones
    end
  end
