Dir[Rails.root.join('lib', 'constraints', '**', '*.rb')].each { |f| require f }