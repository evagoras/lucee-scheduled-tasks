<cfoutput>

	<!--- <cfdump var="#prc.task#"> --->

	<div class="row">
		
		<div class="col">
			<form method="POST" action="#event.buildLink('scheduledtasks.home.save')#">
				<h2>Service</h2>
				<div class="form-group row">
					<label for="task" class="col-2 col-form-label text-right">Name</label>
					<div class="col-10">
						<input type="text" class="form-control" id="task" aria-describedby="taskHelp"
							<cfif prc.task.task.len() GT 0> disabled value="#prc.task.task#"<cfelse> name="task"</cfif>
						>
						<cfif prc.task.task.len() GT 0>
							<input type="hidden" name="task" value="#prc.task.task#" />
						</cfif>
						<small id="taskHelp" class="form-text text-muted">
							The unique name of this task.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">URL</label>
					<div class="col-10">
						<input type="text" class="form-control" id="url" name="url" aria-describedby="urlHelp" value="#prc.task.url#">
						<small id="typeHelp" class="form-text text-muted">
							URL that will be invoked by the task.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">Port</label>
					<div class="col-10">
						<input type="text" class="form-control" id="port" name="port" aria-describedby="portHelp" value="#prc.task.port#">
						<small id="porHelp" class="form-text text-muted">
							Port of the URL to call (HTTP Default: 80).
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">Timeout (in seconds)</label>
					<div class="col-10">
						<input type="text" class="form-control" id="timeout" name="timeout" aria-describedby="timeoutHelp" value="#prc.task.timeout#">
						<small id="timeoutHelp" class="form-text text-muted">
							Timeout in seconds. Defines how long a task will wait for the response of the server called by the URL.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="rows" class="col-2 col-form-label text-right">Username</label>
					<div class="col-10">
						<input type="text" class="form-control" id="username" aria-describedby="usernameHelp" name="username" value="#prc.task.username#">
						<small id="usernameHelp" class="form-text text-muted">
							Username to access the URL if it is protected by authentication.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2 text-right">Run Exclusive</div>
					<div class="col-10">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="unique" name="unique" value="true"<cfif prc.task.unique eq true> checked</cfif>>
							<label class="form-check-label" for="unique">
								If set run the task only once at time. Every time a task is started, 
								it will check if still a task from previous round is running, if so no new test is started.
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="rows" class="col-2 col-form-label text-right">Password</label>
					<div class="col-10">
						<input type="text" class="form-control" id="password" aria-describedby="passwordHelp" name="password" value="#prc.task.password#">
						<small id="passwordHelp" class="form-text text-muted">
							Username to access the URL if it is protected by authentication.
						</small>
					</div>
				</div>
				<h2>Proxy Settings</h2>
				<p>When there is a Proxy Server between the Lucee Server and the called URL, you can define the Proxy Servers Setting here to access the URL</p>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">Server</label>
					<div class="col-10">
						<input type="text" class="form-control" id="proxyserver" name="proxyserver" aria-describedby="proxyserverHelp" value="#prc.task.proxyserver#">
						<small id="proxyserverHelp" class="form-text text-muted">
							The address of the proxy server (example: my.proxy.com).
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">Port</label>
					<div class="col-10">
						<input type="text" class="form-control" id="proxyport" name="proxyport" aria-describedby="proxyportHelp" value="#prc.task.proxyport#">
						<small id="proxyportHelp" class="form-text text-muted">
							Port of the proxy server.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="rows" class="col-2 col-form-label text-right">Username</label>
					<div class="col-10">
						<input type="text" class="form-control" id="proxyuser" aria-describedby="proxyuserHelp" name="proxyuser" value="#prc.task.proxyuser#">
						<small id="proxyuserHelp" class="form-text text-muted">
							Username to access a proxy if it is protected by authentication.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="rows" class="col-2 col-form-label text-right">Password</label>
					<div class="col-10">
						<input type="text" class="form-control" id="proxypassword" aria-describedby="proxypasswordHelp" name="proxypassword" value="#prc.task.proxypassword#">
						<small class="form-text text-muted">
							Password to access a proxy if it is protected by authentication.
						</small>
					</div>
				</div>

				<h2>Logging</h2>
				<p>With the following settings you can define, if Lucee should store the result of the url invocation and where Lucee should store this result.</p>
				<div class="form-group row">
					<div class="col-2 text-right">Save to file</div>
					<div class="col-10">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="publish" name="publish" value="true"<cfif prc.task.publish eq true> checked</cfif>>
							<label class="form-check-label" for="publish">
								Sets, whether the response of server will be stored in a file or not.
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="type" class="col-2 col-form-label text-right">File</label>
					<div class="col-10">
						<input type="text" class="form-control" id="file" name="form_loggingfile" aria-describedby="fileHelp" value="#prc.task.form_loggingfile#">
						<small id="fileHelp" class="form-text text-muted">
							File the output is stored to.
						</small>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2 text-right">Resolve URL</div>
					<div class="col-10">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="resolveurl" name="resolveurl" value="true"<cfif prc.task.resolveurl eq true> checked</cfif>>
							<label class="form-check-label" for="resolveurl">
								Translate relative URLs into absolute.
							</label>
						</div>
					</div>
				</div>

				<h2>Execution Date/Time</h2>
				<p>The current date/time of this Lucee context is: #prc.now#</p>

				<div class="row">
					<div class="col">
						<nav>
							<div class="nav nav-tabs" id="nav-tab-frequency" role="tablist">
								<a class="nav-item nav-link offset-md-2<cfif prc.task.form_interval_frequency eq "once"> active</cfif>" id="interval-frequency-once" data-intervalfrequency="once" data-toggle="tab" href="##frequency-once" role="tab" aria-controls="frequency-once" aria-selected="true">Once</a>
								<a class="nav-item nav-link<cfif prc.task.form_interval_frequency eq "daily"> active</cfif>" id="nav-profile-tab" data-toggle="tab" data-intervalfrequency="daily" href="##nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Daily</a>
								<a class="nav-item nav-link<cfif prc.task.form_interval_frequency eq "weekly"> active</cfif>" id="nav-contact-tab" data-toggle="tab" data-intervalfrequency="weekly" href="##nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Weekly</a>
								<a class="nav-item nav-link<cfif prc.task.form_interval_frequency eq "monthly"> active</cfif>" id="nav-contact-tab" data-toggle="tab" data-intervalfrequency="monthly" href="##nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Monthly</a>
								<a class="nav-item nav-link<cfif prc.task.form_interval_frequency eq "every"> active</cfif>" id="nav-contact-tab" data-toggle="tab" data-intervalfrequency="every" href="##nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Every</a>
							</div>
						</nav>
						<input type="hidden" name="form_interval_frequency" id="form_interval_frequency" value="" />
					</div>
				</div>

				<div class="clearfix">&nbsp;</div>
				
				<div class="form-group row" id="startdate_section">
					<label for="type" class="col-2 col-form-label text-right" id="label_startdate">Start Date</label>
					<div class="col-10">
						<div class="row">
							<div class="col">
								<label for="startdate_day">Day</label>
								<select class="form-control" id="startdate_day" name="form_startdate_day">
									<option></option>
									<cfloop from="1" to="31" index="day">
										<option value="#day#"<cfif prc.task.form_startdate_day eq day> selected</cfif>>#day#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="startdate_month">Month</label>
								<select class="form-control" id="startdate_month" name="form_startdate_month">
									<option></option>
									<cfloop from="1" to="12" index="month">
										<option value="#month#"<cfif prc.task.form_startdate_month eq month> selected</cfif>>#month#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="startdate_year">Year</label>
								<select class="form-control" id="startdate_year" name="form_startdate_year">
									<option></option>
									<cfloop from="#now().year()#" to="#now().year() + 10#" index="year">
										<option value="#year#"<cfif prc.task.form_startdate_year eq year> selected</cfif>>#year#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<small class="form-text text-muted">
							Defines the date when the task should be executed the first time.
						</small>
					</div>
				</div>
				
				<div class="form-group row" id="starttime_section">
					<label for="type" class="col-2 col-form-label text-right" id="label_starttime">Start Time</label>
					<div class="col-10">
						<div class="row">
							<div class="col">
								<label for="starttime_hour">Hour</label>
								<select class="form-control" id="starttime_hour" name="form_starttime_hour">
									<option></option>
									<cfloop list="AM,PM" index="clock" delimiters=",">
										<cfloop from="1" to="12" index="hour">
											<cfset hourValue = clock eq "AM" ? hour : hour + 12>
											<option value="#hourValue#"<cfif prc.task.form_starttime_hour eq hourValue> selected</cfif>>#hour# #clock#</option>
										</cfloop>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="starttime_minute">Minute</label>
								<select class="form-control" id="starttime_minute" name="form_starttime_minute">
									<option></option>
									<cfloop from="1" to="60" index="minute">
										<option value="#minute#"<cfif prc.task.form_starttime_minute eq minute> selected</cfif>>#minute#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="starttime_second">Second</label>
								<select class="form-control" id="starttime_second" name="form_starttime_second">
									<option></option>
									<cfloop from="1" to="60" index="second">
										<option value="#second#"<cfif prc.task.form_starttime_second eq second> selected</cfif>>#second#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<small class="form-text text-muted">
							Defines the time when Lucee starts to executed the task within every day.
						</small>
					</div>
				</div>
				
				<div class="form-group row" id="enddate_section">
					<label for="type" class="col-2 col-form-label text-right">End Date</label>
					<div class="col-10">
						<div class="row">
							<div class="col">
								<label for="enddate_day">Day</label>
								<select class="form-control" id="enddate_day" name="form_enddate_day">
									<option></option>
									<cfloop from="1" to="31" index="day">
										<option value="#day#"<cfif prc.task.form_enddate_day eq day> selected</cfif>>#day#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="enddate_month">Month</label>
								<select class="form-control" id="enddate_month" name="form_enddate_month">
									<option></option>
									<cfloop from="1" to="12" index="month">
										<option value="#month#"<cfif prc.task.form_enddate_month eq month> selected</cfif>>#month#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="enddate_year">Year</label>
								<select class="form-control" id="enddate_year" name="form_enddate_year">
									<option></option>
									<cfloop from="#now().year()#" to="#now().year() + 10#" index="year">
										<option value="#year#"<cfif prc.task.form_enddate_year eq year> selected</cfif>>#year#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<small class="form-text text-muted">
							Define a date when the task should be executed the last time.
						</small>
					</div>
				</div>
				
				<div class="form-group row" id="endtime_section">
					<label for="type" class="col-2 col-form-label text-right">End Time</label>
					<div class="col-10">
						<div class="row">
							<div class="col">
								<label for="endtime_hour">Hour</label>
								<select class="form-control" id="endtime_hour" name="form_endtime_hour">
									<option></option>
									<cfloop list="AM,PM" index="clock" delimiters=",">
										<cfloop from="1" to="12" index="hour">
											<cfset hourValue = clock eq "AM" ? hour : hour + 12>
											<option value="#hourValue#"<cfif prc.task.form_endtime_hour eq hourValue> selected</cfif>>#hour# #clock#</option>
										</cfloop>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="endtime_minute">Minute</label>
								<select class="form-control" id="endtime_minute" name="form_endtime_minute">
									<option></option>
									<cfloop from="1" to="60" index="minute">
										<option value="#minute#"<cfif prc.task.form_endtime_minute eq minute> selected</cfif>>#minute#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="endtime_second">Second</label>
								<select class="form-control" id="endtime_second" name="form_endtime_second">
									<option></option>
									<cfloop from="1" to="60" index="second">
										<option value="#second#"<cfif prc.task.form_endtime_second eq second> selected</cfif>>#second#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<small class="form-text text-muted">
							Define the time when Lucee stop to executed the task within every day.
						</small>
					</div>
				</div>
				
				<div class="form-group row" id="interval_section">
					<label for="type" class="col-2 col-form-label text-right">Interval</label>
					<div class="col-10">
						<div class="row">
							<div class="col">
								<label for="interval_hours">Hours</label>
								<select class="form-control" id="interval_hours" name="form_interval_hours">
									<option value="0"></option>
									<cfloop from="1" to="24" index="hour">
										<option value="#hour#"<cfif prc.task.form_interval_hours eq hour> selected</cfif>>#hour#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="interval_minutes">Minutes</label>
								<select class="form-control" id="interval_minutes" name="form_interval_minutes">
									<option value="0"></option>
									<cfloop from="1" to="60" index="minute">
										<option value="#minute#"<cfif prc.task.form_interval_minutes eq minute> selected</cfif>>#minute#</option>
									</cfloop>
								</select>
							</div>
							<div class="col">
								<label for="interval_seconds">Seconds</label>
								<select class="form-control" id="interval_seconds" name="form_interval_seconds">
									<option value="0"></option>
									<cfloop from="1" to="60" index="second">
										<option value="#second#"<cfif prc.task.form_interval_seconds eq second> selected</cfif>>#second#</option>
									</cfloop>
								</select>
							</div>
						</div>
						<small class="form-text text-muted">
							Define the time when Lucee stop to executed the task within every day.
						</small>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-2 text-right">Paused</div>
					<div class="col-10">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="paused" name="paused" value="true"<cfif prc.task.paused eq true> checked</cfif>>
							<label class="form-check-label" for="paused">
								By setting this flag, the execution of the task will be paused.
							</label>
						</div>
					</div>
				</div>

				<p>&nbsp;</p>

				<input type="hidden" name="form_mode" value="#rc.form_mode#" />

				<div class="form-group row">
					<label for="rows" class="col-2 col-form-label text-right"></label>
					<div class="col-10">
						<button type="submit" class="btn btn-primary">#prc.task.task.len() gt 0 ? "Update" : "Create"#</button>
					</div>
				</div>

			</form>
		</div>

	</div>
	
</cfoutput>

<script type="text/javascript">
	$(function () {
		$('#nav-tab-frequency a').on('click', function (e) {
			e.preventDefault();
			var frequency = $(this).data('intervalfrequency');
			switch (frequency) {
				case "once":
					$("#label_startdate").empty().append("Execute Start Date");
					$('#label_starttime').empty().append('Execute Start Time');
					$('#startdate_section').show();
					$('#starttime_section').show();
					$('#enddate_section').hide();
					$('#endtime_section').hide();
					$('#interval_section').hide();
					break;
				case "daily":
					$("#label_startdate").empty().append("Start Date");
					$('#label_starttime').empty().append('Execution Time');
					$('#startdate_section').show();
					$('#starttime_section').show();
					$('#enddate_section').show();
					$('#endtime_section').hide();
					$('#interval_section').hide();
					break;
				case "weekly":
					$("#label_startdate").empty().append("Start Date");
					$('#label_starttime').empty().append('Execution Time');
					$('#startdate_section').show();
					$('#starttime_section').show();
					$('#enddate_section').show();
					$('#endtime_section').hide();
					$('#interval_section').hide();
					break;
				case "monthly":
					$("#label_startdate").empty().append("Start Date");
					$('#label_starttime').empty().append('Execution Time');
					$('#startdate_section').show();
					$('#starttime_section').show();
					$('#enddate_section').show();
					$('#endtime_section').hide();
					$('#interval_section').hide();
					break;
				case "every":
					$("#label_startdate").empty().append("Start Date");
					$('#label_starttime').empty().append('Start Time');
					$('#startdate_section').show();
					$('#starttime_section').show();
					$('#enddate_section').show();
					$('#endtime_section').show();
					$('#interval_section').show();
					break;

			}
			$('#form_interval_frequency').val(frequency);
		});
		$('#nav-tab-frequency').find('[data-intervalfrequency="<cfoutput>#prc.task.form_interval_frequency#</cfoutput>"]').trigger('click');
	});
</script>