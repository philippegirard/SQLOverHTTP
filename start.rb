# add /app to `require` lookup location
$LOAD_PATH.unshift('./app')

require "SQLOHTTP"

SQLOHTTP.run!