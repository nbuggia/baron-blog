<<<<<<< HEAD
###
# Baron configuration

require 'baron'

baron = Baron::Server.new do  
  set :disqus, true
  set :title, 'nathan buggia'
  set :description, 'Bing UX / Bing Webmaster / Microsoft Enterprise Architecture / PalmOS'
  set :author, 'nathan'
  set :date, lambda {|now| now.strftime("#{now.day} %b %Y") }
  set :permalink_prefix, 'posts'
  set :theme, 'typography'
  set :permalink_date_format, :no_date
  set :article_max, 10
  set :url, 'http://www.buggia.org/'
  set :permalink_prefix, 'posts'
  set :google_analytics, ''
  set :google_webmaster, ''
end

###
# Rack configuration

use Rack::Static, :urls => ['/themes', '/downloads', '/images']
=======

require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

<<<<<<< HEAD
# RUN!
run baron
=======
#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  # set :author,    ENV['USER']                               # blog author
  # set :title,     Dir.pwd.split('/').last                   # site title
  # set :root,      "index"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e


