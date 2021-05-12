# README

Create your own Bread packaging divider.

by Redmund Nacario

* How to run the test suite
  
 1. Rspec:

    `bundle exec rspec`

* How to create Bread package divider for a new bread
  
 1. Rspec:

    ```ruby
    vs5_order = Bread.new("tinapay", 3, prices ={2 => 3, 1 => 2})
    vs5_order.get_packs()
    vs5_order.compute_price_per_pack()
    vs5_order.compute_total_price()

    puts vs5_order.count_per_pack
    puts vs5_order.price_per_pack
    puts vs5_order.total_price
    ```