class Contact
  attr_reader(:contactname, :number)
  @@allcontacts = []
    define_method(:initialize) do |attributes|
      @contactname = attributes.fetch(:contactname)
      @number = attributes.fetch(:number)
      @id = @@allcontacts.length().+(1)
    end

  define_singleton_method(:all) do
    @@allcontacts
  end

  define_method(:save) do
    @@allcontacts.push(self)
    self
  end

  define_singleton_method(:clear) do
    @@allcontacts = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@allcontacts.each() do |contact|
      if contact.id().eql?(id.to_i())
        found_contact = contact
      end
    end
    found_contact
  end
end
