express = require('express')
app     = express()
http    = require('http')
server  = http.createServer(app)
io      = require('socket.io').listen(server)

server.listen 8080

app.get '/', (req, res) ->
    res.sendfile __dirname + '/index.html'

io.sockets.on 'connection', (socket) ->
    socket.emit 'news',
        hello: 'world'

    socket.on 'my other event', (data) ->
        console.log data
