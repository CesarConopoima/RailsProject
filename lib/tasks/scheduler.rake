desc "This task is called by the Heroku scheduler add-on"

task :delete_carts => :production do
  puts "Deleting Carts"
  Cart.destroy_all
  puts "done."
end