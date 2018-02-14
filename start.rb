# add /app to `require` lookup location
$LOAD_PATH.unshift('./app')
$LOAD_PATH.unshift('./lib')

require "SQLOHTTP"

SQLOHTTP.run!