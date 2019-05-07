component singleton {

	public query function getAll() {
		var tasks = queryNew("");
		schedule action="list" returnvariable="tasks";
		return tasks;
	}

	public any function getByName(required string name) {
		var tasks = getAll();
		var task = queryNew("");
		task = queryExecute(
			"select * from tasks where task=:taskName",
			{
				taskname = {
					value = name,
					cfsqltype = "cf_sql_varchar"
				}
			},
			{ dbtype = "query" }
		);
		return task;
	}

	function update(required any dto) {
		schedule action="update"
			operation = "HTTPRequest"
			task = dto.task
			file = dto.file
			path = dto.path
			startdate = dto.startdate
			starttime = dto.starttime
			url = dto.url
			port = dto.port
			publish = isBoolean(dto.publish) == true ? true : false
			enddate = dto.enddate
			endtime = dto.endtime
			interval = dto.interval
			requesttimeout = dto.timeout
			username = dto.username
			password = dto.password
			proxyserver = dto.proxyserver
			proxyport = dto.proxyport
			proxyuser = dto.proxyuser
			proxypassword = dto.proxypassword
			resolveurl = dto.resolveurl;
		if (dto.paused == true) {
			schedule task = dto.task action="pause";
		} else {
			schedule task = dto.task action="resume";
		}
	}

}