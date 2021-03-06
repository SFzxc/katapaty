module Katapaty
  class Configuration
    attr_accessor :username,
                  :password,
                  :host,
                  :port

    def api_url
      "http://#{@username}:#{@password}@#{@host}:#{@port}/api/"
    end
  end
end
