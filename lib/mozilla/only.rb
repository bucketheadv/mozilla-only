require "mozilla/only/version"
require 'useragent'

module Mozilla
  module Only
    # Your code goes here...
    class Client
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        if ::UserAgent.parse(env['HTTP_USER_AGENT']).browser.downcase == 'firefox'
          [400, {}, ["Bad Request"]]
        else
          [status, headers, body]
        end
      end
    end
  end
end

require "mozilla/only/railtie" if defined?(::Rails)
