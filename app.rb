require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  @contactname = params.fetch('contactname')
  Contact.new(@contactname).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  phone_type = params.fetch('phone_type')
  phone_number = params.fetch('phone_number')
  @phone = Phone.new({:phone_type => phone_type, :phone_number => phone_number})
  @phone.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_numbers(@phone)
  redirect back
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  @numbers = Phone.all()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/clear') do
  @contacts = Contact.all()
  @contacts.clear()
  erb(:index)
end
