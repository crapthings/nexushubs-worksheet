Accounts.onCreateUser (options, user) ->
	if options.content
		user.content = options.content
	return user