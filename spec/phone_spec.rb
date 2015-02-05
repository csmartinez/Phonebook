require('rspec')
require('contact')
require('phone')

describe('Phone') do
  before() do
    Phone.clear()
  end

  describe(:phone_number)	do
    it("returns a contact's number") do
      new_contact = Phone.new({:phone_number => "249-424-2422", :phone_type => "home"})
      new_contact.save()
      expect(new_contact.phone_number()).to(eq("249-424-2422"))
    end
  end

  describe(:phone_type)	do
    it("returns a contact's phone type")do
      new_contact = Phone.new({:phone_number => "249-424-2422", :phone_type => "home"})
      new_contact.save()
      expect(new_contact.phone_type()).to(eq("home"))
    end
  end

  describe(".clear") do
    it("erases all stored contact's additional numbers") do
      Phone.new({:phone_number => "249-424-2422", :phone_type => "home"}).save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end
end
