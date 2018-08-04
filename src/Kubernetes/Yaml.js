exports.safeLoadImpl = function(left){
  return function(right){
    return function(str){
      try {
        const yaml = require('js-yaml')
        return right(yaml.safeLoad(str))
      } catch (e) {
        return left(e)
      }
    }
  }
}
