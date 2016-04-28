_ = lodash

faker = require 'faker'

Meteor.users.remove {}
Tasks.remove {}

Meteor.startup ->

	unless Meteor.users.findOne { username: 'demo' }
		Accounts.createUser
			username: 'demo'
			content: 'demo'
			password: 'demo'

console.log 12