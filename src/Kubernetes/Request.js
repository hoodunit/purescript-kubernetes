const http = require('http')
const https = require('https')

exports.requestImpl = function(config){
  return function(){
    const lib = config.options.protocol === "https:" ? https : http;
    const req = lib.request(config.options, function(res){
      res.setEncoding("utf8");
      var responseBody = "";
      res.on("data", function(chunk){
        responseBody = responseBody + chunk.toString();
      })
      res.on("end", function(){
        const response = config.mkResponse(res.statusCode)(responseBody);
        config.callback(config.right(response))();
      })
    })
    req.on("error", function(e){
      config.callback(config.left(e))();
    })
    req.on("socket", function(socket){
      socket.on("error", function(e){
        config.callback(config.left(e))();
        req.abort();
      })
    })
    if(config.isJust(config.body)){
      req.write(config.fromJust(config.body));
    }
    req.end();
  }
}
