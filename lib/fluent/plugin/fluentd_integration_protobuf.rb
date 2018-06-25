require_relative 'my_proto_msg_pb'

module Fluent
  module Integration
    # add ability to decode fluentd messages
    class Protobuf
      def initialize
        @msg = nil
      end

      def feed(message)
        self.msg = Zeromq::TestMessage.decode(message)
      end

      def read
        msg
      end

      private

      attr_accessor :msg
    end
  end
end
