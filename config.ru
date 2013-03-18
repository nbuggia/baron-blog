###
# Baron configuration

require 'baron'

baron = Baron::Server.new do

  # Turns on blog comments using disqus. true or false
  set :disqus, true

  # Specify the title of your blog
  set :title, 'Robert Frost'

  # Specify a description for your blog
  set :description, 'The fake blog of Robert Frost'

  # Path to the image used in the site header
  set :header_image, 'robert-frost.png'
  set :header_image_small, 'robert-frost-small.png'

  # Specify the name you want your articles to appear written by
  set :author, 'Rob'

  # Provide a ruby block function used to render the date
  # http://ruby-doc.org/core-2.0/Time.html#method-i-strftime
  set :date, lambda {|now| now.strftime("#{now.day} %b %Y") }
  
  # Prefix your permalink URL. This is useful for maintaining compatibility
  # with the permalink format of your current blog, or so your permalink URLs
  # don't collide with your custom pages 
  set :permalink_prefix, ''

  # Specify which theme you would like to use. You can see the list of themes 
  # in the themes/ folder.
  # TODO: link to article for hacking your own theme
  set :theme, 'typography'

  # Specify how and if you would like the article date to be included in your 
  # permalink URL. 
  # Options: :year_date, :year_month_date, :year_month_day_date, :no_date 
  set :permalink_date_format, :year_month_day_date
  
  # Specifies the maximum number of articles that will be show on the home page
  set :article_max, 3

  # Specify the URL of your blog for creating permalinks (good in case people
  # steal your content, then the links will still point to your articles.)
  # for example: http://nathanbuggia.com
  set :url, 'http://localhost:3000/'

  # specify your google analytics ID 
  # format of "UA-XXXXXX-X"
  set :google_analytics, ''

  # specify your google webmaster key 
  # format: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  set :google_webmaster, ''

  # You can add any value here like this:
  # => set :foo_bar, 'foobar'
  # and then access it from any of the rhtml templates like this:
  # => <%= @config[:foo_bar] %>

end
 
###
# Rack configuration

# Rack will allow public access to these folders (and sub folders), though it 
# will not support directory browsing. Add your own folders.
use Rack::Static, :urls => ['/themes', '/downloads', '/images']

use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

# RUN!
run baron