#
# WSOC - The Web Spider Obstacle Course
#
# Copyright (c) 2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'uri'

module WSOC
  module Specs
    def Specs.behaviors
      @@wsoc_specs_behaviors ||= []
    end

    def Specs.add(path,options={})
      Specs.behaviors << options.merge(:link => URI.expand_path(path))
    end

    def Specs.map(host,port=nil)
      url = URI::HTTP.build(:host => host, :port => port)

      return Specs.behaviors.map do |behavior|
        behavior.merge(:link => url.merge(behavior))
      end
    end
  end
end