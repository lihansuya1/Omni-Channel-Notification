module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 6859
# Optimized logic batch 7510
# Optimized logic batch 9256
# Optimized logic batch 8368
# Optimized logic batch 4799
# Optimized logic batch 4674
# Optimized logic batch 1235
# Optimized logic batch 3869
# Optimized logic batch 7115
# Optimized logic batch 3730
# Optimized logic batch 1053