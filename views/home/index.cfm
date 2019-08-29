<cfoutput>

<div class="row">
	<div class="col">
		<h1>Scheduled Tasks</h1>
	</div>
</div>
<p></p>

<div class="row">
	<div class="col">
		<cfif prc.tasks.len() gt 0>
			<a class="btn btn-danger" href="" role="button" id="btn-pause-all">
				<i class="far fa-pause-circle"></i> Pause All
			</a>
			<a class="btn btn-success" href="" role="button" id="btn-resume-all">
				<i class="fas fa-play-circle"></i> Resume All
			</a>
		</cfif>
		<a class="btn btn-primary" href="#event.buildLink('scheduledtasks.home.new')#" role="button">
			<i class="far fa-calendar-alt"></i> Add New
		</a>
	</div>
</div>

<p></p>

<cfif prc.tasks.len() gt 0>
	
	<div class="row">
		<div class="col">
			<table class="table table-striped table-hover" id="tbl-tasks">
				<thead>
					<tr class="bg-warning">
						<th><div class="text-left">Actions</div></th>
						<th>Status</th>
						<th>Task Name</th>
						<th>URL</th>
						<th>Start Time</th>
						<th>End Time</th>
						<th nowrap>Run Exclusive</th>
						<th nowrap>Run Interval (sec)</th>
						<th>Timeout</th>
					</tr>
				</thead>
				<tbody>
					<cfloop array="#prc.tasks#" index="task">
						<tr<cfif task.task eq rc.task> class="table-success"</cfif>>
							<td nowrap>
								<a role="button" class="btn btn-sm btn-info" href="#event.buildLink('scheduledtasks.home.edit.task.#task.task#')#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="far fa-edit"></i></a>
								<cfif task.paused eq true>
									<a class="btn btn-danger btn-sm taskAction" data-action="resume" data-task="#task.task#" href="" role="button" data-toggle="tooltip" data-placement="top" title="Resume"><i class="fas fa-pause-circle"></i></a>
								<cfelse>
									<a class="btn btn-success btn-sm taskAction" data-action="pause" data-task="#task.task#" href="" role="button" data-toggle="tooltip" data-placement="top" title="Pause"><i class="fas fa-play-circle"></i></a>
								</cfif> 
								<a class="btn btn-danger btn-sm taskDelete" data-action="delete" data-task="#task.task#" href="" data-href="#event.buildLink('scheduledtasks.home.delete.task.#task.task#')#" role="button" data-toggle="tooltip" data-placement="top" title="Delete"><i class="far fa-trash-alt"></i></a>
							</td>
							<td>
								<cfif task.paused eq true>
									<span class="badge badge-pill badge-warning task-status">Stopped</span>
								<cfelse>
									<span class="badge badge-pill badge-success task-status">Running</span>
								</cfif>
							</td>
							<td nowrap>#task.task#</td>
							<td><a href="#task.url_with_port#" target="_blank">#task.url_with_port# <i class="fas fa-external-link-alt"></i></a></td>
							<td>#dateTimeFormat(task.startDateTime, "yyyy-mm-dd h:nn:ss tt")#</td>
							<td>#dateTimeFormat(task.endDateTime, "yyyy-mm-dd h:nn:ss tt")#</td>
							<td>#yesNoFormat( task.unique )#</td>
							<td>#task.interval#</td>
							<td>#task.timeout#</td>
						</tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	</div>

</cfif>
	
</cfoutput>

<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Delete Task</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to delete this task? The process is irreversible.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">No, Cancel Deletion</button>
				<a class="btn btn-primary btn-ok" role="button" href="" id="link-delete-task">Yes, Delete</a>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	
	$( '#btn-resume-all' ).click( function( event ) {
		event.preventDefault();
		$( '#tbl-tasks a[data-action="resume"]' ).each( function() {
			$( this ).click();
		} );
	} );

	$( '#btn-pause-all' ).click( function( event ) {
		event.preventDefault();
		$( '#tbl-tasks a[data-action="pause"]' ).each( function() {
			$( this ).click();
		} );
	} );

	$( 'a.taskDelete' ).click( function( event ) {
		event.preventDefault();
		$( '#link-delete-task' ).attr( 'href', $( this ).attr( 'data-href' ) );
		$( '#confirm-delete' ).modal( 'show' );
	} );

	$('a.taskAction').click(function( event ) {
		event.preventDefault();
		var link = $(this);
		link.blur();
		var action = link.attr('data-action');
		var task = link.attr('data-task');
		var icon = link.find('i');
		var status = link.parent().next().find('span.badge');
		icon.removeClass();
		icon.addClass('fas fa-spinner fa-spin');
		$.post("/scheduledtasks/home/togglePaused", {task: task, action: action})
			.done(function(response) {
				if (response.paused == true) {
					// link
					link.removeClass('btn-success');
					link.addClass('btn-danger');
					link.attr('data-action', 'resume');
					link.attr('data-original-title', 'Resume');
					link.attr('title', 'Resume');
					// action button
					icon.removeClass();
					icon.addClass('fas fa-pause-circle');
					// status
					status.removeClass('badge-success');
					status.addClass('badge-warning');
					status.text('Stopped');
				} else {
					// link
					link.removeClass('btn-danger');
					link.addClass('btn-success');
					link.attr('data-action', 'pause'); 
					link.attr('data-original-title', 'Pause');
					link.attr('title', 'Pause');
					// action button
					icon.removeClass();
					icon.addClass('fas fa-play-circle');
					// status
					status.removeClass('badge-warning');
					status.addClass('badge-success');
					status.text('Running');
				}
				link.mouseout();
			});
   });

});
</script>