# Call this file 'helloworld.rb'
require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::Helloworld < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   helloworld { ... }
  # }
  config_name "helloworld"

  # New plugins should start life at milestone 1.
  milestone 1

  # Replace the message with this value.
  config :new_message, :validate => :string

  public
  def register
    # nothing to do
  end # def register

  public
  def filter(event)

    if @message
      # Replace the event message with our message as configured in the
      # config file.
      event["message"] = @new_message
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Helloworld

