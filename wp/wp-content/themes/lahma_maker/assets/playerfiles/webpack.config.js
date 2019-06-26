module.exports = {
  mode: 'production',
  output: {
    publicPath: 'dist',
    filename: 'radio_player.js',
    library: 'RadioPlayer'
},
module: {
    rules: [
        {
            test: /\.vue$/,
            loader: 'vue-loader',
            options: {}
        },
        {
            test: /\.scss$/,
            use: [
                'vue-style-loader',
                'css-loader',
                'sass-loader'
            ]
        },
        {
            test: /\.m?js$/,
            use: {
              loader: 'babel-loader',
              options: {
                presets: ['@babel/preset-env']
              }
            }
          }
          
    ]
}
}