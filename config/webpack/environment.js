// config/webpack/environment.js
const { generateWebpackConfig, merge } = require('shakapacker');
const webpack = require('webpack');

const providePlugin = new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default'],
  'window.moment': 'moment',
  moment: 'moment'
});

const customConfig = {
  plugins: [providePlugin],
  optimization: {
    splitChunks: {
      cacheGroups: {
        commons: {
          test: /[\\/]node_modules[\\/]/,
          chunks: 'all',
          minChunks: 2
        }
      }
    }
  },
  module: {
    rules: [
      {
        test: /jquery\.flot\.resize\.js$/,
        use: [{ loader: 'imports-loader', options: { wrapper: 'window' } }]
      }
    ]
  }
};

module.exports = generateWebpackConfig(customConfig);
