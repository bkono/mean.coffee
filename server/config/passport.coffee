mongoose = require 'mongoose'
BasicStrategy = require('passport-http').BasicStrategy
User = require("../users/users.model")

module.exports = (passport) ->

  passport.use new BasicStrategy ({}), (username, password, done) ->
    User.findOne { username: username }, (err, user) ->
      return done(err) if err
      if not user then return done(null, false)
      if not user.authenticate(password) then return done(null, false)
      return done(null, user)

  passport.serializeUser (user, done) ->
    done(null, user.id)

  passport.deserializeUser (id, done) ->
    User.findById id, (err, user) ->
      done(err, user)
