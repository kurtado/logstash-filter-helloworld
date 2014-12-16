require "logstash/devutils/rspec/spec_helper"
require "logstash/filters/helloworld"

describe LogStash::Filters::Helloworld do
  describe "Set to Hello World" do
    config <<-CONFIG
      filter {
        helloworld {
          new_message => "Hello World"
        }
      }
    CONFIG

#    sample("some text") do # <- this also works to explicitly set the "message" field
    sample("message" => "some text") do
      insist { subject }.include?("message")
      insist { subject["message"] } == "Hello World"
    end
  end
end
