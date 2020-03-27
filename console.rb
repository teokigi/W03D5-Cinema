require('pry-byebug')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')


ticket.delete_all
ticket = Ticket.new({'customer_id'=>1,'film_id'=>1})
ticket.save
# ticket = ({'customer_id'=>1,'film_id'=>2})
# ticket.save
# ticket = ({'customer_id'=>2,'film_id'=>1})
# ticket.save
# ticket = ({'customer_id'=>2,'film_id'=>2})
# ticket.save
# ticket = ({'customer_id'=>3,'film_id'=>3})
# ticket.save
# ticket = ({'customer_id'=>3,'film_id'=>1})
# ticket.save
# ticket = ({'customer_id'=>4,'film_id'=>2})
# ticket.save
# ticket = ({'customer_id'=>4,'film_id'=>3})
# ticket.save
# ticket = ({'customer_id'=>5,'film_id'=>4})
# ticket.save
# ticket = ({'customer_id'=>5,'film_id'=>1})
# ticket.save
# ticket = ({'customer_id'=>6,'film_id'=>2})
# ticket.save
# ticket = ({'customer_id'=>6,'film_id'=>3})
# ticket.save
# ticket = ({'customer_id'=>7,'film_id'=>4})
# ticket.save
# ticket = ({'customer_id'=>7,'film_id'=>1})
# ticket.save
# ticket = ({'customer_id'=>8,'film_id'=>2})
# ticket.save
# ticket = ({'customer_id'=>8,'film_id'=>3})
# ticket.save
# ticket = ({'customer_id'=>9,'film_id'=>4})
# ticket.save
# ticket = ({'customer_id'=>9,'film_id'=>5})
# ticket.save
# ticket = ({'customer_id'=>10,'film_id'=>1})
# ticket.save
# ticket = ({'customer_id'=>10,'film_id'=>2})

binding.pry
nil
