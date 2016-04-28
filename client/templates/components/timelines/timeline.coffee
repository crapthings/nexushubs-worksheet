_ = lodash

faker = require 'faker'

Template.timeline.viewmodel

	users: Meteor.users.find()

	tasks: Tasks.find()

	onCreated: -> @templateInstance.subscribe 'users'

	onRendered: ->

		timeline = new vis.Timeline @templateInstance.find '.timeline'

		timeline.setOptions
			editable: true
			orientation: 'top'

			onAdd: (item) ->
				item.group = Meteor.userId()
				Meteor.call 'newTask', item

			onUpdate: (item) ->
				content = prompt item.content
				if content
					opt =
						content: content
					Meteor.call 'updateTask', item._id, opt

			onMove: (item) ->
				Meteor.call 'moveTask', item._id, item.start

			onRemove: (item) ->
				Meteor.call 'removeTask', item._id

		Meteor.autorun =>

			groups = _.map @users().fetch(), (group) ->
				group.id = group._id
				return group

			items = @tasks().fetch()

			timeline.setData
				groups: groups
				items: items
