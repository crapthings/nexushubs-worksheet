Meteor.users.helpers

	content: 1

if Meteor.isServer

	Meteor.publish '', ->
		Meteor.users.find { _id: @userId },
			fields:
				services: false

	Meteor.publish 'users', ->
		Meteor.users.find {},
			fields:
				services: false
