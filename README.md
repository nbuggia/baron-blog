#Baron Blog Engine Gem

No one needs another blog engine. This is just a side project to play around
with Ruby and a small web-based app. I wanted to create the simplest content 
management engine that included all the features I was looking for to 
power my blog. 

## Features

* Publish to Heroku (or similar) using Git
* Easy to customize the look & feel via a common site layout template
* Author posts or custom pages in markdown or HTML
* Organize content into categories
* Several permalink formats are supported, including a custom prefix and several date formats
* 301 or 302 redirects are supported for easy porting from your current blog
* SEO optimized with built-in support for Robots.txt, Google Analytics, Google web master tools

##Quick Start

Dependencies: <a href="http://git-scm.com/">git</a>, 
<a href="https://devcenter.heroku.com/articles/quickstart">heroku</a>, 
<a href="http://www.ruby-lang.org/en/downloads/">ruby</a>

	$ git clone https://github.com/nbuggia/baron-blog.git
	$ cd baron-blog
	$ heroku create my-blog-name
	$ git push heroku master
	$ heroku open

##Customize Your Blog

	$ less config.ru

Most configuration can be adjusted in this file: <a href="https://github.com/nbuggia/baron-blog/blob/master/config.ru">config.ru</a>. 
The file is well documented for all the options.

###Creating Your Own Themes

Themes are self-contained within their own folders under the <code>./themes</code>
folder.

I would recommend starting by forking this project and then duplicating one of 
the existing themes and modifying it.

* Theme-specific configuration - Each theme has a theme_config.yml file where
you can specify your own parameters and then access them from within the templates 
via <code>&lt;%= @theme[:foo_bar] %&gt;</code>
* Each rendering template has access to all the varables documented in the 
<code>/test/</code> page from your blog (unless you've deleted it).

##Create New Article

	$ rake new
	Title: Blog Title

The easiest way to create a new article is to use the helper comand in the rake 
file as show above. It will automatically create a new article for you with the 
current date.

You can also create a new article manually by saving a text file with a 
filename in the following format:

	YYYY-MM-DD-article-title.txt

Where <code>YYYY-MM-DD</code> is the articles data of publication with. Where 
YYYY means the year in 4 digits, MM means the month in two digits and DD means 
the day of the month in 2 digits.

Writing the Article:

The first few lines of the file are where you can place attribute value
pairs in YAML format (e.g. <code>my_attribute: 'attribute'</code>). Add two new 
lines to start the article, and then you can write it using markdown, HTML, 
plain text, or a combination of all 3.

* You can add additional attributes you want and then access them in the rhtml 
template with <code>@article[:my_attribute]</code>.
* If you need to use ':' or other special characters in your value, wrap it in 
quotes (e.g. <code>title: "My article: Lots & Lots of Smiles"</code>)

Sample article: 

	---
	title: The Road Not Taken
	author: Robert Frost
	---
	
	Two roads diverged in a yellow wood,<br/>
	And sorry I could not travel both<br/>
	And be one traveler, long I stood<br/>
	And looked down one as far as I could<br/>
	To where it bent in the undergrowth;

Publish Post: 

Move the article from your drafts folder to somewhere in your <code>articles/</code>
folder and then publish the blog (see **Publish Your Blog**)

Any folders created in the <code>articles/</code> folder will automatically 
converted into categories in the blog. I recommend that you keep foldernames 
all lower case, and use '-' instead of spaces to keep your URLs clean.

##Create A Custom Page

You can also create custom pages that are accessible one level off your blog's 
root like /about, /contact-us or /project-foobar. Simply create a new file in
the <code>/pages</code> folder with the following format:

	page-name.rhtml

The <code>page-name</code> will be used as the URL (e.g. my-blog.com/page-name) 

* Make sure that you avoid URL collisions by not naming this the same as any of 
your categories, or article names. Or add a :permalink_prefix in the 
<code>config.ru</code> to disambiguate.
* I recommend keeing the page titles in all lower case, use '-' for spaces to 
keep your URLs pretty (and functional)
* Custom pages have access to all the same variables as the rendering 
templates, you can see this list of variables by going to the /test page on 
your blog after you run it.

Example Custom Page: 

	<header>
		<h1>About Robert Frost</h1>
	</header>

	<article>
		<p>
			TODO: add a nice description for Mr. Robert Frost
		</p>	
	</article>

## Heroku Config

	$ git add .
	$ git commit -m 'Publishing article: My article name'
	$ git push heroku master

Before you publish, you should delete a few things:

* ./pages/test.rhtml
* ./images/baron-von-underbite.png

### Adding a Custom Domain Name

From the Heroku Dashboard, go to the **Settings** section of the app you 
created, and enter your domain in the **Domains** section. Always specify a 
sub-domain (like 'www') in your domain name when using heroku.

Update your DNS Provider:

You'll need to update your DNS records from your registrar with Heroku's name 
servers. Heroku provides instructions here: <a href="https://devcenter.heroku.com/articles/custom-domains">
https://devcenter.heroku.com/articles/custom-domains</a>

Map Naked Domains:

my-domain.com &rarr; www.my-domain.com

Naked domains are not supported in Heroku (e.g. domains without a sub-domain at the 
beginning - <a href="https://devcenter.heroku.com/articles/avoiding-naked-domains-dns-arecords">
https://devcenter.heroku.com/articles/avoiding-naked-domains-dns-arecords</a>)

Use your DNS registrar's URL forwarding service to map the naked to the 'www' 
version.

Instructions for: <a href="http://support.godaddy.com/help/article/422/forwarding-or-masking-your-domain-name">GoDaddy</a>,
<a href="http://www.namecheap.com/support/knowledgebase/article.aspx/385/77/how-do-i-set-up-url-forwarding-for-a-domain">NameCheap</a>, etc

## Redirects

	$ less ./resources/redirects.txt

Baron supports redirects to make it easy to migrate from another engine, and 
so you can fix broken links or URL restructuring over time.

This is what a Redirect looks like:

	Redirect 301 /page/1 /

Here's what the fields mean

* **Redirect** - just indicates the start of the line, no other options 
available at this time
* **301** - this is the status code, 301 means permanent redirect. Check out 
this article from Google covering all the possible codes and how you should use
them: http://support.google.com/webmasters/bin/answer.py?hl=en&answer=40132
* **/page/1** - specifies the source URL. This is the broken URL you are going 
to redirect to somewhere else.
* **/** - specifies the desitination URL. This is where you are redirecting to

## Blog File Structure

	├── Gemfile								List the dependencies for the blog
	├── Gemfile.lock						Heroku uses this to install dependencies
	├── Rakefile							Helper code for managing your blog
	├── articles/							place your published articles here
	│   ├── 2012-11-09-sample-1.txt			Date and URL slug are the filename
	│   └── category/						Creating folders puts these articles in a category
	│   ├── another-category/				Use dashes ('-') for spaces in folder names
	├── config.ru							Configure features of the blog here
	├── downloads/							Files in here are publicly accessible	
	├── drafts/								Place for your unfinished articles
	├── images/								Images in here are publicly accessible
	├── pages/								You can create custom pages in here
	│   ├── about.rhtml 					Example custom page
	│   └── test.rhtml 						Custom page that illustrates the variables available
	├── resources/							Resources used by the blog that are theme independent
	│   ├── feed.rss						Rss feed rendering template
	│   ├── redirects.txt					List of redirects the blog will process
	│   └── robots.txt						Robots.txt file (rendered!)
	└── themes/								
	    └── my-theme/						Each theme has the same folder structure
	        ├── css/
	        ├── img/
	        ├── js/
	        └── templates/					rhtml rendering templates for each page type
##Thanks

While writing this blog engine, I barrowed a lot of code and design approaches
from the Toto project by Cloudhead and the Scanty project by Adam Wiggins. The
primary purpose of this project was a learning one for me, and both of these
folks provided a lot of good code an examples. I'm not sure how much code or 
design awesomeness one needs to use before they are obligated to include their 
license, so I'm included a link to each of them just in case.

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