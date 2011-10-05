http = require 'http'
winston = require 'winston'

app = http.createServer (req, res) ->
	winston.log 'info', 'received a request'

	res.writeHead 404
	res.end 'your request got evaporated'

app.listen 3003
