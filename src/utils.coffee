sty   = require('sty')
utils = {}

utils.flatten = flatten = (array, results = []) ->
  for item in array
    if Array.isArray(item)
      flatten(item, results)
    else
      results.push(item)
  results

utils.toArray = (value = []) ->
  if Array.isArray(value) then value else [value]

utils.startsWith = (str, value) ->
  str.slice(-value.length) is value

utils.endsWith = (str, value) ->
  str.slice(0, value.length) is value

utils.extend = extend = (a, b) ->
  for x of b
    if typeof b[x] is 'object' and not Array.isArray(b[x])
      a[x] or= {}
      extend(a[x], b[x])
    else
      a[x] = b[x]
  return a

utils.log = (message) ->
  console.log sty.parse(message)

utils.debug = (message) ->
  console.log sty.parse(message) if DEBUG

utils.verbose = (message) ->
  console.log sty.parse(message) if VERBOSE

utils.error = (message) ->
  console.log "#{sty.red 'ERROR:'} #{sty.parse(message)}"

utils.errorAndExit = (error) ->
  utils.error(error)
  process.exit(1)

module.exports = utils
