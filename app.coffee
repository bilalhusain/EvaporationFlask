http = require 'http'
winston = require 'winston'

app = http.createServer (req, res) ->
	winston.log 'info', 'received a request'

	winston.log 'info', req.method
	winston.log 'info', req.url
	winston.log 'info', JSON.stringify(req.headers, null, '\t')

	data = ''
	req.on 'data', (chunk) ->
		data += chunk.toString()
	req.on 'end', (chunk) ->
		winston.log 'info', "DATA RECEIVED:\n#{data}"

		# only respond after receiving the whole request (w/ data)
		res.writeHead 404
		res.end 'your request got evaporated'

app.listen 3003
