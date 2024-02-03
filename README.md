# README

Requirements
```
ruby 2.7.3
rails 5.2.8
```

For starting the server run
```rails s```

For starting the worker, first spin up a console and run this command
```
while true
  `curl localhost:3000/broadcast`
  sleep 1
end
```

This piece of code will hit the broadcast action every second.


The app/controllers/logs_controller.rb controller is responsible to check for updates to the file and publish it to the 'logs' channel

I have used 'Simple WebSocket Client' chrome extension to simulate clients joining to the websocket 
For connect to the websocket you can entire this endpoint
```ws://localhost:3000/cable```
You can put this message to subscribe to the logs channel
```{"command":"subscribe","identifier":"{\"channel\":\"LogsChannel\"}"}```
