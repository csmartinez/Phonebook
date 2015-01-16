require('rspec')
require('phonebook')

describe('Contact') do
  before() do
    Contact.clear()
  end
  describe(".all") do
    it("starts out empty") do
      expect(Contact.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("saves name and number into a hash of all contacts") do
      new_contact = Contact.new({:contactname => "Kelly", :number => "6024890731"})
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end
  describe(".clear") do
    it("erases all stored contacts") do
      new_contact = Contact.new({:contactname => "Kelly", :number => "6024890731"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
  describe("#id") do
    it("assigns an id to each contact") do
      new_contact = Contact.new({:contactname => "Kelly", :number => "6024890731"}).save()
      expect(new_contact.id()).to(eq(1))
    end
  end
  describe(".find") do
    it("returns a contact by it's id number") do
      new_contact1 = Contact.new({:contactname => "Kelly", :number => "6024890731"}).save()
      new_contact1.save()
      new_contact2 = Contact.new({:contactname => "Kelly", :number => "6024890731"}).save()
      new_contact2.save()
      expect(Contact.find(new_contact1.id())).to(eq(new_contact1))
    end
  end
end
