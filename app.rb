require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/phonebook')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/mycontact') do
  contactname = params.fetch('contactname')
  number = params.fetch('number')
  @newcontact = Contact.new({:contactname => contactname, :number => number})
  @newcontact.save()
  @contacts = Contact.all()
  erb(:index)
end

# post('/phone') do
#   phonetype = params.fetch('phonetype')
#   morenumbers = params.fetch('morenumbers')
#   @phone = Phone.new({:phonetype => phonetype, :morenumbers => morenumbers})
#   @phone.save()
#   @numbers = Phone.all()
#   erb(:mycontact)
# end

get('/mycontact/:id') do
  @foundcontact = Contact.find(params.fetch("id"))
  erb(:mycontact)
end

get('/clear') do
  @contacts = Contact.all()
  @contacts.clear()
  erb(:index)
end
