require('pry-byebug')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

loop_program = "loop"
while loop_program != ""
    p "1. delete all,2. repopulate ticket,"
    case gets.chomp
        when "1"
            Customer.delete_all
            Film.delete_all
            Ticket.delete_all
        when "2"
            customer01 = Customer.new({'name'=>'Bob Marley','funds'=> 100})
            customer01.save
            customer02 = Customer.new({'name'=>'Jennifer Anniston','funds'=> 99)
            customer02.save
            customer03 = Customer.new({'name'=>'Bon Jovi','funds'=> 98)
            customer04.save
            customer05 = Customer.new({'name'=>'Markus Meechan','funds'=> 97)
            customer05.save
            customer06 = Customer.new({'name'=>'Emma Watson','funds'=> 96)
            customer06.save
            customer07 = Customer.new({'name'=>'Ryan Reynolds','funds'=> 95)
            customer07.save
            customer08 = Customer.new({'name'=>'Nichola Sturgeon','funds'=> 94)
            customer08.save
            customer09 = Customer.new({'name'=>'David Cameron','funds'=> 93)
            customer09.save
            customer10 = Customer.new({'name'=>'Boris Johnson','funds'=> 92)
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


            ticket01 = Ticket.new({'customer_id'=>1,'film_id'=>1})
            ticket01.save
            ticket02 = Ticket.new({'customer_id'=>1,'film_id'=>2})
            ticket02.save
            ticket03 = Ticket.new({'customer_id'=>2,'film_id'=>1})
            ticket03.save
            ticket04 = Ticket.new({'customer_id'=>2,'film_id'=>2})
            ticket04.save
            ticket05 = Ticket.new({'customer_id'=>3,'film_id'=>3})
            ticket05.save
            ticket06 = Ticket.new({'customer_id'=>3,'film_id'=>1})
            ticket06.save
            ticket07 = Ticket.new({'customer_id'=>4,'film_id'=>2})
            ticket07.save
            ticket08 = Ticket.new({'customer_id'=>4,'film_id'=>3})
            ticket08.save
            ticket09 = Ticket.new({'customer_id'=>5,'film_id'=>4})
            ticket09.save
            ticket10 = Ticket.new({'customer_id'=>5,'film_id'=>1})
            ticket10.save
            ticket11 = Ticket.new({'customer_id'=>6,'film_id'=>2})
            ticket11.save
            ticket12 = Ticket.new({'customer_id'=>6,'film_id'=>3})
            ticket12.save
            ticket13 = Ticket.new({'customer_id'=>7,'film_id'=>4})
            ticket13.save
            ticket14 = Ticket.new({'customer_id'=>7,'film_id'=>5})
            ticket14.save
            ticket15 = Ticket.new({'customer_id'=>8,'film_id'=>1})
            ticket15.save
            ticket16 = Ticket.new({'customer_id'=>8,'film_id'=>2})
            ticket16.save
            ticket17 = Ticket.new({'customer_id'=>9,'film_id'=>3})
            ticket17.save
            ticket18 = Ticket.new({'customer_id'=>9,'film_id'=>4})
            ticket18.save
            ticket19 = Ticket.new({'customer_id'=>10,'film_id'=>5})
            ticket19.save
            ticket20 = Ticket.new({'customer_id'=>10,'film_id'=>1})
            ticket20.save
    end
    p "1. loop program 2.end program"
    loop_program = gets.chomp
end
