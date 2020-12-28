mongoose = require('mongoose')

handleFailure = () =>
  console.log("There was an error")
  return process.exit(1)

module.exports =
  connect: () =>
    connection = mongoose.connection

    mongoose.set('useUnifiedTopology', true)

    mongoose.connection.on "error", handleFailure
    mongoose.connection.on "open", () =>
      console.log("MongoDB connected to[-- #{connection.db.databaseName} --]")

    mongoose.connect(process.env.MONGO_CLIENT_KWC, { useNewUrlParser : true } )
