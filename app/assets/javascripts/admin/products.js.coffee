jQuery ->
	if $('body').data('controller-name') in ['products']
		$("[rel='tooltip']").tooltip()
		$("#post_body").qeditor({})