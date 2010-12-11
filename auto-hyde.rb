#!/usr/bin/ruby

status = DATA.flock(File::LOCK_EX | File::LOCK_NB)

puts "Another process has the lock" && exit unless status == 0

require 'rubygems'
require 'sinatra'
require 'systemu'

post '/[redacted]' do
   result = systemu('cd ~/blog && git pull && jekyll --pygments ../_site')
   if result[0] == 0
      "Rebuild Successful"
   else
      "Rebuild Failed:\n" + result[2]
   end
end


__END__

### this data section MUST be here for DATA.flock to function.

### the user locking the script MUST have write privledges to the script
