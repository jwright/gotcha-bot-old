require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/gotcha_bot'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Web::Application, at: '/'
end
