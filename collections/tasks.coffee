if Meteor.isServer

	Meteor.publish '', ->
		Tasks.find {}
