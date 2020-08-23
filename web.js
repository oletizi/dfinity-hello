const {program} = require('commander')
const config = require('config')
const webConfig  = config.get('web')

console.log('host: ',webConfig.host)
console.log('port: ', webConfig.port)