module Mozilla
  module Only
    class Railtie < ::Rails::Railtie
      initializer "mozilla-only" do |_|
        ::Rails.application.configure do |config|
          config.middleware.insert_before 0, "Mozilla::Only::Client"
        end
      end
    end
  end
end
