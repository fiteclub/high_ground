const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

environment.loaders.prepend('erb', {
  test: /\.erb$/,
  enforce: 'pre',
  use: [{
    loader: 'rails-erb-loader',
  }]
})
module.exports = environment
