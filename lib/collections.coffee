@Tasks = new Mongo.Collection 'tasks'

Tasks.before.update (userId, task) ->
	return userId is task.group

Meteor.methods

	newTask: (opt) ->
		opt.start = opt.start or new Date()
		Tasks.insert opt

	updateTask: (id, opt) ->
		Tasks.update id,
			$set: opt

	moveTask: (id, date) ->
		Tasks.update id,
			$set:
				start: date

	removeTask: (id) ->
		Tasks.remove id