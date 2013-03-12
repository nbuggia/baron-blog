#Dev Notes


##Domain Name Configuration




Then setup use the Forwarding feature in GoDaddy to send buggia.org --> www.buggia.org

<<<<<<< HEAD
http://stackoverflow.com/questions/11492563/heroku-godaddy-send-naked-domain-to-www



      articles.each { |a|
        puts "article : " + a[:filename_and_path] + ", " + a[:filename].to_s + ", " + a[:category].to_s + ", " + a[:date].to_s
      }








	  Todo

	  I decided to recreate one anyways as a way to learn Ruby. I started 
	  with Cloudhead's <a href="http://cloudhead.io/toto">Toto blog engine</a>, 
	  and have rewritten much of the flow in a way that seemed easier to follow, 
	  with a few more features and a lot more comments, in about 20% less code. 
	  Generally, I think it is poor form to fork someone else's project and repost 
	  it, however, my grad vision isn't in the spirit of the original project. In 
	  keeping with the namming theme I've named it after my favorite dog: Baron 
	  von Underbite.

	  **Features:**

	  * Add new articles or custom pages in markdown, text or HTML
	  * Many permalink formats are supported, including a custom prefix and several date formates
	  * 301 or 302 redirects are support for easy porting from your current blog
	  * Easy to customize the look & feel via a common site layout template

	  Minimalist means there is no editor or admin section in the blog. Simply update the files directly and use git to push them to your hoster (I'd recommend heroku, its free and awesome. Detailed instructions below)

	  ##Quickstart

	  **Download Blog**

	  	$ git clone git://github.com/nbuggia/baron-theme-von-underbite.git your_blog_name
	  	$ cd your_blog_name

	  **Configure Blog**

	  	$ vim config.cu

	  **Create Article**

	  	$ rake new
	  	Title: My New Blog Entry
	  	$ vim articles/2013-01-01-my-new-blog-entry

	  **Deploy Blog (to Heroku)**

	  	$ heroku create your_blog_name
	  	$ git push heroku master


	  The bog engine is a ruby gem that is included in the theme, so all you need to do is to deploy the theme to heroku. Then you can add articles in the ./articles folder, custom pages in the ./pages folder or hack the look & feel in the ./templates and ./public/css folders.

	  ## Templates

	  ##Quick How To's

	  ###Deploy to Heroku

	  create the app
	  push to heroku
	  associate a domain name
	  redirect the nude to the www
	  keep the dynamo spun up

	  ###Author New Post

	  use markdown, text or HTML
	  prepend the file with the date for easy sorting
	  use the filename
	  use attributes in the file

	  ###Create A New Custom Page

	  use the directory structure

	  ###Setup redirects


	  ###SEO


	  ###Create Your Own Themes

	  **Namesake**

	  ![Baron von Underbite](baron-von-underbite.png)


	  ##ToDo List

	  [ ] Regular expressions support in the redirects file
	  [ ] Add your most recent instagram photo to your blog chrome via javascript
	  [ ] Custom pages and templates should be able to bypass site template if they include an HTML tag
	  [ ] Robots.txt

	  TODO: clean up variable names for category, directory and folder
	  TODO: optimize process_redirects, doesn't seem very ruby-like
	  TODO: can I move the controller classess to be private classes inside blog_engine? No one outside should be instantiating them, right?
	  TODO: disambiguate articles with the same article_slug by category or date
	  TODO: don't fire the site layout template if the partial page include an HTML open tag


	  ##How it works

	  All the code is in one file, and there are only 316 lines.


	  ##Much Thanks

	  Cloudhead
	  adam wiggins

	  Then setup use the Forwarding feature in GoDaddy to send buggia.org --> www.buggia.org

	  http://stackoverflow.com/questions/11492563/heroku-godaddy-send-naked-domain-to-www




	  ##License

	  This software is licensed under the MIT Software License

	  Copyright (c) 2013 Nathan Buggia

	  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=======
http://stackoverflow.com/questions/11492563/heroku-godaddy-send-naked-domain-to-www
>>>>>>> b40ccab1a167fe8866d90bcfb79961470dbc407e
