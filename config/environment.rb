require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/bootcamphub'
require_relative '../apps/landing/application'

Hanami.configure do
  mount Landing::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/bootcamphub_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/bootcamphub_development'
    #    adapter :sql, 'mysql://localhost/bootcamphub_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/bootcamphub/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end
