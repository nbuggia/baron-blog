<<<<<<< HEAD
require 'baron'

@config = Baron::Config::Defaults
=======
require 'toto'

@config = Toto::Config::Defaults
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e

task :default => :new

desc "Create a new article."
task :new do
  title = ask('Title: ')
<<<<<<< HEAD
  slug = title.empty? ? nil : title.strip.slugize
=======
  slug = title.empty?? nil : title.strip.slugize
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e

  article = {'title' => title, 'date' => Time.now.strftime("%d/%m/%Y")}.to_yaml
  article << "\n"
  article << "Once upon a time...\n\n"

<<<<<<< HEAD
  path = "#{Baron::Paths[:articles]}/#{Time.now.strftime("%Y-%m-%d")}#{'-' + slug if slug}.#{@config[:ext]}"
=======
  path = "#{Toto::Paths[:articles]}/#{Time.now.strftime("%Y-%m-%d")}#{'-' + slug if slug}.#{@config[:ext]}"
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e

  unless File.exist? path
    File.open(path, "w") do |file|
      file.write article
    end
<<<<<<< HEAD
    baron "an article was created for you at #{path}."
  else
    baron "I can't create the article, #{path} already exists."
=======
    toto "an article was created for you at #{path}."
  else
    toto "I can't create the article, #{path} already exists."
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e
  end
end

desc "Publish my blog."
task :publish do
<<<<<<< HEAD
  baron "publishing your article(s)..."
  `git push heroku master`
end

def baron msg
=======
  toto "publishing your article(s)..."
  `git push heroku master`
end

def toto msg
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e
  puts "\n  toto ~ #{msg}\n\n"
end

def ask message
  print message
  STDIN.gets.chomp
end

