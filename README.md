#The Baron Blog

A full-featured, yet minimalist, blog engine for developers

I know what you're thinking, the world doesn't need another Ruby blog 
engine. And, okay, you're right, however Baron is a little bit different from
all the others in that it is a lot more full-featured, and still only a scant 
400 lines of easy-to-ready code.

**Features**
* Publish to heroku (or similar PaaS) using Git
* Author articles or custom pages in markdown, text or HTML
* Article categories supported by simply putting articles in a folder
* Many permalink formats are supported, including a custom prefix and several 
date formats
* 301 or 302 redirects are support for easy porting from your current blog
* SEO optimized with built-in support for Robots.txt, Google Analytics, Google 
web master tools
* Easy to customize the look & feel via a common site layout template
* Frameworks used: Rack, RSpec, Bootstrap, JQuery, Disqus, Thin

##Quick Start

Dependencies: <a href="http://git-scm.com/">git</a>, 
<a href="https://devcenter.heroku.com/articles/quickstart">heroku</a>, 
<a href="http://www.ruby-lang.org/en/downloads/">ruby</a>

	$ git clone https://github.com/nbuggia/baron-blog.git
	$ mv baron-blog my-blog
	$ heroku create my-blog
	$ TODO: heroku add local...????
	$ git init
	$ git add .
	$ git commit -m 'First commit of my new blog!'
	$ git push heroku master
	$ heroku open

Yay! Now you probably are going to want to customize this thing, read on for 
all the bells and whistles.

##Quick How To's

###Customize Your Blog

	$ less config.ru

There are many bells and whistles available for your blog, most of them can be 
set from inside <code>config.ru</code>. The file is well documented for all the 
options.

The other big customization route is to hack the theme to either make your own,
or to just modify it the way you'd like. Check out the 
**Creating Your Own Themes*** section for more information.

###Adding a Custom Domain Name (with Heroku)

Go to the config section of your blog app and then enter in one or more new
domain names. Next step is to redirect your DNS server to to heroku

**GoDaddy**


**FOOBAR**


If you have a different hoster, just ask google how to set it up.

Finally, you'll want to redirect the nude domain name to www, like this:

my-domain.com &rarr; www.my-domain.com

###Create New Post

	$ rake new
	Title: My Blog Title

This command creates a new blog post with the current date in your 
<code>drafts/</code> folder.

To create a new post, you simply create a new text file in your favorite 
editor. Simply save the file somewhere in your <code>articles/</code> folder in
the format of <code>YYYY-MM-DD-article-title.txt</code>. Where YYYY means the
year in 4 digits, MM means the month in two digits and DD means the day of the 
month in 2 digits.

**Attributes**

The first few lines of the file are where you can place attribute value
pairs in YAML format (e.g. <code>my_attribute: 'attribute'</code>). Add two new 
lines to start the article, and then you can write it using markdown, HTML, 
plain text, or a combination of all 3.

* You can add additional attributes you want and then access them in the rhtml 
template with <code>@article[:my_attribute]</code>.
* If you need to use ':' or other special characters in your value, wrap it in 
quotes (e.g. <code>title: "My article: Lots & Lots of Smiles"</code>)

Notes

* Baron forces all folder names and file names to lower case for canonicalization
* You can't have periods in the file name

###Create A New Custom Page

use the directory structure

###Setup redirects


###SEO

###Explore the Project

Project structure:

		├── Gemfile
		├── Rakefile
		├── articles/							place your published articles here
		│   ├── 2012-11-09-sample-1.txt			the date and URL slug are the filename
		│   └── category/						creating folders puts these articles in a category
		│   ├── another category/				spaces in folder names will be replaces with '-'s
		├── config.ru							configure features of the blog here
		├── downloads/							files in here are publicly accessible	
		├── drafts/								place for your unfinished articles
		├── images/								images in here are publicly accessible
		├── pages/								you can create custom pages in here
		│   └── about.rhtml
		├── resources/							
		│   ├── feed.rss						your rss feed's rendering template
		│   ├── redirects.txt					list of redirects the blog will process
		│   └── robots.txt						your robots.txt file
		└── themes/
		    └── my-theme/						each theme has the same folder structure
		        ├── css/
		        ├── img/
		        ├── js/
		        └── templates/					rhtml rendering templates for each page type

###Create a New Article


###Create a New Page


###Add a Custom Domain Name in Heroku (free!)

TODO

###Deploy to Heroku (free!)

TODO

###Domain Name Configuration

Then setup use the Forwarding feature in GoDaddy to send buggia.org --> www.buggia.org

http://stackoverflow.com/questions/11492563/heroku-godaddy-send-naked-domain-to-www


###Run Blog Locally

Uses Thin to run the blog

	> cd my-blog
	> sudo gem install thin
	> thin start

If you make a change to config.ru, you will need to restart thin.

###Creating Your Own Themes


##Next Steps

I wrote this as an excuse to learn a handful of new technologies and approaches, 
like Ruby and TDD. There are an ambitious set of features I'd like to add that 
each align to something else I would like to learn:

* Themes - I'm designing 3-4 fancy, shmancy themes to try out this new 'flat'
and minimalist thing everyone's excited about. Also a good excuse to dig into
HTML5, CSS3, JQuery, Instagram's API and a few other things.

* Pre-rendering - the platform nerd in me doesn't understand why the whole 
blog isn't pre-rendered at deploy time so heroku just serves static HTML and
assets (a la <a href="https://github.com/mojombo/jekyll">Jekyll</a>)

* JavaScript Comments - the blog engine currently uses Disqus for comments,
which is free and cool, but I hate letting other people own my data. I want 
to build something similar to Disqus on top of 
<a href="https://www.parse.com/">Parse</a> / 
<a href="https://github.com/documentcloud/backbone">Backbone</a> and make it 
really easy to use

* Simple Plugin Model - I've always wanted to write a plug-in model. I tried
to write one in C++ in college and was only able to do static linking (lame). I
think an interpreted language will make it much easier, right?

##Namesake

Pictures of the adorable baron von underbite

##Thanks

While writing this blog engine, I barrowed a lot of code and design approaches
from the Toto project by Cloudhead and the Scanty project by Adam Wiggins. The
primary purpose of this project was a learning one for me, and both of these
folks provided a lot of good code an examples. I'm not sure how much code or 
design awesomeness one needs to use before they are obligated to include their 
license, so I'm included a link to each of them just in case (and thank you 
both for your awesomeness!)

Toto
 - URL: https://github.com/cloudhead/toto
 - Author: http://cloudhead.io/ (Alexis Sellier)
 - License: https://github.com/cloudhead/toto/blob/master/LICENSE

Scanty
 - URL: https://github.com/adamwiggins/scanty
 - Author: http://about.adamwiggins.com/ (Adam Wiggins)

##License

This software is licensed under the MIT Software License

Copyright (c) 2013 Nathan Buggia

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.