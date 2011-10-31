#!/bin/ruby

# puts "Running #{$0}"
# puts "Args: #{$*}"

def print_usage
  puts "Purpose: Check servers for httpd in the init.d.  Executes 'chkconfig --list -httpd' on each server"
  puts "Usage: #{ARGF} server01 server02 server03 ..."
  puts "  where 'serverXX' is the name of the server to check for httpd in init.d"
  exit 0
end


print_usage if ARGV.size == 0

ARGV.each{|server|
  result = %x["ssh #{server} /sbin/chkconfig --list -httpd"]
}