class Contact
  @@allcontacts = []

  define_method(:initialize) do |contactname|
    @contactname = contactname
    @phones = []
    @id = @@allcontacts.length().+(1)
  end

  define_method(:contact_name) do
		@contact_name
	end

  define_method(:phones) do
    @phones
  end

  define_method(:add_numbers) do |number|
    @phones.push(number)
  end

	define_method(:id) do
 		@id
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
