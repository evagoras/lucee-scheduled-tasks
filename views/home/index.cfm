<cfoutput>

<div class="row">
	<div class="col">
		<h1>Scheduled Tasks</h1>
	</div>
</div>
<p></p>

<div class="row">
	<div class="col">
		<a class="btn btn-primary" href="#event.buildLink('scheduledtasks.home.new')#" role="button">
			<i class="far fa-calendar-alt"></i> Add New
		</a>
	</div>
</div>

<p></p>

<cfif prc.tasks.len() gt 0>
	
	<div class="row">
		<div class="col">
			<table class="table table-striped table-hover">
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
								<a role="button" class="btn btn-sm btn-warning" href="#event.buildLink('scheduledtasks.home.edit.task.#task.task#')#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="far fa-edit"></i></a>
								<!--- <a role="button" class="btn btn-sm btn-danger" href="#event.buildLink('tasks.delete.task.#task.task#')#" data-toggle="tooltip" data-placement="top" title="Delete"><i class="far fa-trash-alt"></i></a> --->
								<cfif task.paused eq true>
									<a class="btn btn-primary btn-sm taskAction" data-action="resume" data-task="#task.task#" href="" role="button" data-toggle="tooltip" data-placement="top" title="Resume"><i class="fas fa-play-circle"></i></a>
								<cfelse>
									<a class="btn btn-danger btn-sm taskAction" data-action="pause" data-task="#task.task#" href="" role="button" data-toggle="tooltip" data-placement="top" title="Pause"><i class="fas fa-pause-circle"></i></span>
								</cfif>
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

<script>
$(function() {
	
	$('a.taskAction').click(function() {
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
					link.removeClass('btn-danger');
					link.addClass('btn-primary');
					link.attr('data-action', 'resume');
					link.attr('data-original-title', 'Resume');
					link.attr('title', 'Resume');
					// action button
					icon.removeClass();
					icon.addClass('fas fa-play-circle');
					// status
					status.removeClass('badge-success');
					status.addClass('badge-warning');
					status.text('Stopped');
				} else {
					// link
					link.removeClass('btn-primary');
					link.addClass('btn-danger');
					link.attr('data-action', 'pause'); 
					link.attr('data-original-title', 'Pause');
					link.attr('title', 'Pause');
					// action button
					icon.removeClass();
					icon.addClass('fas fa-pause-circle');
					// status
					status.removeClass('badge-warning');
					status.addClass('badge-success');
					status.text('Running');
				}
				link.mouseout();
				link.mouseover();
			});
   });

});
</script>