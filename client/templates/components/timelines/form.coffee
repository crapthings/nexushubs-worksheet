Template.tlForm = Template.fromString """
	<form {{b "submit: submit"}}>
		<input type="text" {{b "value: content"}}>
		<input type="submit">
	</form>
"""

Template.tlForm.viewmodel

	submit: (e) ->
		do e.preventDefault

		opt =
			group: Meteor.userId()
			content: @content()

		unless opt.content
			alert 'none'
			return

		Meteor.call 'newTask', opt, (err, resp) =>
			@reset() unless err
