require "bundler"

Bundler.setup(:default)
Bundler.require

class PutsWorker
  include Sidekiq::Worker

  def perform(count)
    puts "Executando o Worker numero #{count}"
  end
end

500.times do |count|
  PutsWorker.perform_async(count)
end