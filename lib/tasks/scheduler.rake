desc "This task is called by the Heroku scheduler add-on"

task :delete_carts => :environment do
  puts "Deleting Carts"
  Cart.destroy_all
  puts "done."
end

task :delete_not_payed_orders => :environment do
  puts "Deleting not payed orders"
  Order.erase_not_processed_order
  puts "done."
end