### Hey there <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px">
<br />


#### Problem Statement

1. Receives a log as argument (webserver.log is provided)
  - e.g.:
	`./parser.rb webserver.log`
2. Returns the following:
  - list of webpages with most page views ordered from most pages views to less page views
  e.g.:
	`/home 90 visits /index 80 visits ..etc`
  - list of webpages with most unique page views also ordered
  e.g.:
  ```
 	 /about/2 8 unique views
 	 /index 5 unique views etc...
  ```

#### How to  execute test cases
	bundle install
	bundle exec rspec spec

