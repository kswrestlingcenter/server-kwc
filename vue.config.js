module.exports = {
  devServer: {
    // devtool: 'inline-source-map',
    proxy: {
      "/api": {
        target: "http://localhost:5051"
      }
    }
  }
}