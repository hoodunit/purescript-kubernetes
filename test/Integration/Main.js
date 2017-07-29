exports.parseIntImpl = function(just, nothing, value) {
  if (/^(\-|\+)?([0-9]+|Infinity)$/.test(value)){
    return just(Number(value));
  } else {
    return nothing;
  }
}
