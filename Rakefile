require 'baron'

@config = Baron::Config::Defaults

task :default => :help

desc "list available commands"
task :help do
  puts "rake new\n"
end

desc "Create a new article."
task :new do
  title = ask('Title: ')
  slug = title.empty? ? nil : title.strip

  article = {'title' => title, 'date' => Time.now.strftime("%d/%m/%Y")}.to_yaml
  article << "\n"
  article << "Once upon a time...\n\n"

  path = "drafts/#{Time.now.strftime("%Y-%m-%d")}#{'-' + slug if slug}.#{@config[:ext]}"

  unless File.exist? path
    File.open(path, "w") do |file|
      file.write article
    end
    puts "an article was created for you at #{path}."
  else
    puts "I can't create the article, #{path} already exists."
  end
end

#desc "Publish my blog."
#task :publish do
#  puts "publishing your article(s)..."
#  `git push heroku master`
#end

def ask message
  print message
  STDIN.gets.chomp
end