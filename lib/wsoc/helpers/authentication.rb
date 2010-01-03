#
# WSOC - The Web Spider Obstacle Course
#
# Copyright (c) 2009-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
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

module WSOC
  module Helpers
    module Authentication

      #
      # Protects an action by requiring HTTP Basic Access Authentication.
      #
      # @since 0.1.1
      #
      def protected!
        response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth") and \
        throw(:halt, [401, "Not authorized\n"]) and \
        return unless authorized?
      end

      # 
      # Checks to see if the requesting user is authorized.
      #
      # @since 0.1.1
      #
      def authorized?
        @auth ||=  Rack::Auth::Basic::Request.new(request.env)
        @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'password']
      end
    end
  end
end
