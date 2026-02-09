require "./connected/*"
module Lattice
  module Connected
    # used for logging
    def self.shorten_socket(socket)
      "socket_#{socket.object_id.to_s[-3..-1]}"
    end

    # used for logging
    def self.shorten_session(session_id)
      "session_#{session_id[-3..-1]}"
    end

    def self.log(indicator, message, level = :default)
      colorized_indicator = 
        case indicator
        when :in
          "data in".colorize(:red).on(:white)
        when :out
          "data out".colorize(:green).on(:white)
        when :process
          "process ".colorize(:light_gray).on(:dark_gray)
        when :validate
          "validate".colorize(:light_gray).on(:dark_gray)
        else
          "UNKNOWN".colorize(:white).on(:red)
        end
      Log.info { "#{colorized_indicator} #{message}" }
    end

  end
end
