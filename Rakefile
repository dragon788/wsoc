# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'

Hoe.plugin :yard

Hoe.spec('wsoc') do
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.yard_opts += ['--protected']
  self.remote_yard_dir = '/'

  self.extra_deps += [
    ['json', '>=1.2.0'],
    ['sinatra', '>=0.9.4']
  ]
end

# vim: syntax=ruby
