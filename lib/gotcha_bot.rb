require 'lotus/model'
Dir["#{ __dir__ }/gotcha_bot/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/gotcha_bot_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/gotcha_bot_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/gotcha_bot_development'
  #    adapter type: :sql, uri: 'mysql://localhost/gotcha_bot_development'
  #
  adapter type: :sql, uri: ENV['GOTCHA_BOT_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :bots do
      entity     Bot
      repository BotRepository

      attribute :id,                Integer
      attribute :access_token,      String
      attribute :name,              String
      attribute :bot_id,            String
      attribute :team_id,           Integer
    end

    collection :players do
      entity     Player
      repository PlayerRepository

      attribute :id,                Integer
      attribute :username,          String
      attribute :email,             String
      attribute :first_name,        String
      attribute :last_name,         String
      attribute :avatar_url,        String
      attribute :user_id,           String
      attribute :team_id,           Integer
    end

    collection :teams do
      entity     Team
      repository TeamRepository

      attribute :id,                Integer
      attribute :access_token,      String
      attribute :name,              String
      attribute :team_id,           String
    end
  end
end.load!
