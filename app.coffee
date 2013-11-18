express = require('express');
app = express()

blogEngine = require('./blog')

app.configure ->
  app.set 'views', './views'
  app.set 'view engine', 'jade'

  app.use app.router
  # Client-side assets will be served from a separate ./public folder
  #   i.e. http://yourhost.com/js/main.js will link to ./public/js/main.js
  app.use express.static('./public')

  # app.use express.bodyParser()

# Regular http get
app.get '/', (req, res) ->
	res.render('home', {title: 'My Blog', entries:blogEngine.getBlogEntries()})

app.get '/about', (req, res) ->
	res.render('about', {title:'About Me'})
app.get '/article', (req, res) ->
  entry = blogEngine.getBlogEntry(req.params.id)
  res.render('article',{title:entry.title, blog:entry})

app.listen(3000)
