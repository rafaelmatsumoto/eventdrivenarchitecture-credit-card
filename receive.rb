# frozen_string_literal: true

require './lib/publisher'
subscription_name = 'credit-card-subscription'

pubsub = Publisher.get_publisher

subscription = pubsub.subscription subscription_name
subscriber = subscription.listen do |received_message|
  puts "Requisitando confecção de cartão para #{received_message.data}"
  received_message.acknowledge!
end

subscriber.start
sleep
