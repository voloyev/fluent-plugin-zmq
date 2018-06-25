require_relative 'my_protobuf_msg_pb'

module Fluent
  module Plugin
    # add ability to decode fluentd messages
    class Protobuf
      def initialize
        @msg = nil
      end

      def feed(message)
        self.msg = Tutorial::MyMessage.decode(message)
      end

      def read
        msg
      end

      private

      attr_accessor :msg
    end
  end
end
