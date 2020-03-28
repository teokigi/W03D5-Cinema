require('pry-byebug')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/customer.rb')

loop_program = "1"
while loop_program == "1"
    p "1. delete all"
    p "2. repopulate ticket"
    p "3. get all films viewed by 1 customer"
    p "4. get all customers who has seen a film"
    case gets.chomp
        when "1"
            Customer.delete_all
            Film.delete_all
            Ticket.delete_all
        when "2"
            customer01 = Customer.new({'name'=>'Bob Marley','funds'=> 100})
            customer01.save
            customer02 = Customer.new({'name'=>'Jennifer Anniston','funds'=> 99})
            customer02.save
            customer03 = Customer.new({'name'=>'Bon Jovi','funds'=> 98})
            customer03.save
            customer04 = Customer.new({'name'=>'Markus Meechan','funds'=> 97})
            customer04.save
            customer05 = Customer.new({'name'=>'Emma Watson','funds'=> 96})
            customer05.save
            customer06 = Customer.new({'name'=>'Ryan Reynolds','funds'=> 95})
            customer06.save
            customer07 = Customer.new({'name'=>'Nichola Sturgeon','funds'=> 94})
            customer07.save
            customer08 = Customer.new({'name'=>'David Cameron','funds'=> 93})
            customer08.save
            customer09 = Customer.new({'name'=>'Boris Johnson','funds'=> 92})
            customer09.save
            customer10 = Customer.new({'name'=>'Jeremy Corbin','funds'=> 91})
            customer10.save

            film1 = Film.new({'title'=>'Iron Man','price'=>10})
            film1.save
            film2 = Film.new({'title'=>'Pokemon','price'=>11})
            film2.save
            film3 = Film.new({'title'=>'Swort Art Online','price'=>12})
            film3.save
            film4 = Film.new({'title'=>'Berzerk','price'=>13})
            film4.save
            film5 = Film.new({'title'=>'Elfen Lied','price'=>14})
            film5.save


            ticket01 = Ticket.new({'customer_id'=>customer01.id,'film_id'=>film1.id})
            ticket01.save
            ticket02 = Ticket.new({'customer_id'=>customer01.id,'film_id'=>film2.id})
            ticket02.save
            ticket03 = Ticket.new({'customer_id'=>customer02.id,'film_id'=>film1.id})
            ticket03.save
            ticket04 = Ticket.new({'customer_id'=>customer02.id,'film_id'=>film2.id})
            ticket04.save
            ticket05 = Ticket.new({'customer_id'=>customer03.id,'film_id'=>film3.id})
            ticket05.save
            ticket06 = Ticket.new({'customer_id'=>customer03.id,'film_id'=>film1.id})
            ticket06.save
            ticket07 = Ticket.new({'customer_id'=>customer04.id,'film_id'=>film2.id})
            ticket07.save
            ticket08 = Ticket.new({'customer_id'=>customer04.id,'film_id'=>film3.id})
            ticket08.save
            ticket09 = Ticket.new({'customer_id'=>customer05.id,'film_id'=>film4.id})
            ticket09.save
            ticket10 = Ticket.new({'customer_id'=>customer05.id,'film_id'=>film1.id})
            ticket10.save
            ticket11 = Ticket.new({'customer_id'=>customer06.id,'film_id'=>film2.id})
            ticket11.save
            ticket12 = Ticket.new({'customer_id'=>customer06.id,'film_id'=>film3.id})
            ticket12.save
            ticket13 = Ticket.new({'customer_id'=>customer07.id,'film_id'=>film4.id})
            ticket13.save
            ticket14 = Ticket.new({'customer_id'=>customer07.id,'film_id'=>film5.id})
            ticket14.save
            ticket15 = Ticket.new({'customer_id'=>customer08.id,'film_id'=>film1.id})
            ticket15.save
            ticket16 = Ticket.new({'customer_id'=>customer08.id,'film_id'=>film2.id})
            ticket16.save
            ticket17 = Ticket.new({'customer_id'=>customer09.id,'film_id'=>film3.id})
            ticket17.save
            ticket18 = Ticket.new({'customer_id'=>customer09.id,'film_id'=>film4.id})
            ticket18.save
            ticket19 = Ticket.new({'customer_id'=>customer10.id,'film_id'=>film5.id})
            ticket19.save
            ticket20 = Ticket.new({'customer_id'=>customer10.id,'film_id'=>film1.id})
            ticket20.save
        when "3"
            p "Enter Customer id"
            answer = gets.chomp
            query = Customer.films_by_customer(answer.to_i)
            query.each{|film|p film}
        when "4"
            p "Enter Movie id"
            answer = gets.chomp
            query = Film.customers_by_film(answer.to_i)
            query.each{|customer|p customer}
    end
    p "1.Loop program 2.end program"
    loop_program = gets.chomp
end
