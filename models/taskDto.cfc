component accessors=true {

	property name="tasksService" inject="tasksService@scheduledtasks";

	property name="form_startdate_day";
	property name="form_startdate_month";
	property name="form_startdate_year";
	property name="form_starttime_hour";
	property name="form_starttime_minute";
	property name="form_starttime_second";
	property name="form_enddate_day";
	property name="form_enddate_month";
	property name="form_enddate_year";
	property name="form_endtime_hour";
	property name="form_endtime_minute";
	property name="form_endtime_second";
	property name="form_interval_frequency";
	property name="form_interval_hours";
	property name="form_interval_minutes";
	property name="form_interval_seconds";
	property name="form_mode";
	property name="form_loggingfile";

	property name="task";
	property name="path";
	property name="file";
	property name="startdate";
	property name="starttime";
	property name="enddate";
	property name="endtime";
	property name="url";
	property name="port";
	property name="interval";
	property name="timeout";
	property name="username";
	property name="password";
	property name="proxyserver";
	property name="proxyport";
	property name="proxyuser";
	property name="proxypassword";
	property name="resolveurl";
	property name="publish";
	property name="valid";
	property name="paused";
	property name="autodelete";
	property name="unique";
	property name="url_with_port";

	this.constraints = {
		task = {
			udf = requiredTask,
			udfMessage = "The task name is required"
		}
	};

	function requiredTask() {
		if (isNull(arguments[1]) == true || arguments[1].len() == 0) {
			return false;
		} else {
			return true;
		}
	}

	// property name="ispopulated";

	function init() {
		variables.form_interval_frequency = "every";
		variables.form_startdate_day = "";
		variables.form_startdate_month = "";
		variables.form_startdate_year = "";
		variables.form_starttime_hour = "";
		variables.form_starttime_minute = "";
		variables.form_starttime_second = "";
		variables.form_enddate_day = "";
		variables.form_enddate_month = "";
		variables.form_enddate_year = "";
		variables.form_endtime_hour = "";
		variables.form_endtime_minute = "";
		variables.form_endtime_second = "";
		variables.form_interval_frequency = "";
		variables.form_interval_hours = "";
		variables.form_interval_minutes = "";
		variables.form_interval_seconds = "";
		variables.form_mode = "";
		variables.form_loggingfile = "";
		variables.publish = false;
		variables.resolveurl = false;
		variables.unique = false;
		variables.autodelete = false;
		variables.valid = true;
		return this;
	}

	function getRequestTimeout() {
		return getTimeout();
	}

	function populateFormProperties() {
		if (isNumeric(getInterval()) == true) {
			variables.form_interval_frequency = "every";
			var interval = getInterval();
			variables.form_interval_hours = int(interval / 3600);
			interval = interval - (getform_interval_hours() * 3600);
			variables.form_interval_minutes = int(interval / 60);
			interval = interval - (getform_interval_minutes() * 60);
			variables.form_interval_seconds = interval;
		} else {
			variables.form_interval_frequency = getInterval();
		}
		if (isDate(getstartdate()) == true) {
			variables.form_startdate_day = getstartdate().day();
			variables.form_startdate_month = getstartdate().month();
			variables.form_startdate_year = getstartdate().year();
		}
		if (isDate(getstarttime()) == true) {
			variables.form_starttime_hour = getstarttime().hour();
			variables.form_starttime_minute = getstarttime().minute();
			variables.form_starttime_second = getstarttime().second();
		}
		if (isDate(getenddate()) == true) {
			variables.form_enddate_day = getenddate().day();
			variables.form_enddate_month = getenddate().month();
			variables.form_enddate_year = getenddate().year();
		}
		if (isDate(getendtime()) == true) {
			variables.form_endtime_hour = getendtime().hour();
			variables.form_endtime_minute = getendtime().minute();
			variables.form_endtime_second = getendtime().second();
		}
		variables.form_loggingfile = getPath();
		if (isNull(getFile()) == false && getFile().len() > 0) {
			if (variables.form_loggingfile.len() > 0) {
				variables.form_loggingfile &= "\";
			}
			variables.form_loggingfile &= getFile(); 
		}
	}

	function populateFromForm() {
		var startDateYear = getform_startdate_year().len() > 0 ? getform_startdate_year() : 0;
		var startDateMonth = getform_startdate_month().len() > 0 ? getform_startdate_month() : 0;
		var startDateDay = getform_startdate_day().len() > 0 ? getform_startdate_day() : 0;
		if (startDateDay + startDateMonth + startDateYear > 0) {
			variables.startdate = createDate(
				year = startDateYear,
				month = startDateMonth,
				day = startDateDay);
		}
		// if (
		// 	(isNull(getform_startdate_day()) == false && getform_startdate_day().len() > 0)
		// 	&& (isNull(getform_startdate_month()) == false && getform_startdate_month().len() > 0)
		// 	&& (isNull(getform_startdate_year()) == false && getform_startdate_year().len() > 0)
		// ) {
		// 	variables.startdate = createDate(
		// 		year = getform_startdate_year(),
		// 		month = getform_startdate_month(),
		// 		day = getform_startdate_day());
		// }

		var startTimeHour = getform_starttime_hour().len() > 0 ? getform_starttime_hour() : 0;
		var startTimeMinute = getform_starttime_minute().len() > 0 ? getform_starttime_minute() : 0;
		var startTimeSecond = getform_starttime_second().len() > 0 ? getform_starttime_second() : 0;
		if (startTimeHour + startTimeMinute + startTimeSecond > 0) {
			variables.starttime = createTime(
				hour = startTimeHour,
				minute = startTimeMinute,
				second = startTimeSecond);
		}
		// if (
		// 	(isNull(getform_starttime_hour()) == false && getform_starttime_hour().len() > 0)
		// 	&& (isNull(getform_starttime_minute()) == false && getform_starttime_minute().len() > 0)
		// 	&& (isNull(getform_starttime_second()) == false && getform_starttime_second().len() > 0)
		// ) {
		// 	variables.starttime = createTime(
		// 		hour = getform_starttime_hour(),
		// 		minute = getform_starttime_minute(),
		// 		second = getform_starttime_second());
		// }

		var endDateYear = getform_enddate_year().len() > 0 ? getform_enddate_year() : 0;
		var endDateMonth = getform_enddate_month().len() > 0 ? getform_enddate_month() : 0;
		var endDateDay = getform_enddate_day().len() > 0 ? getform_enddate_day() : 0;
		if (endDateDay + endDateMonth + endDateYear > 0) {
			variables.enddate = createDate(
				year = endDateYear,
				month = endDateMonth,
				day = endDateDay);
		}
		// if (
		// 	(isNull(getform_enddate_day()) == false && getform_enddate_day().len() > 0)
		// 	&& (isNull(getform_enddate_month()) == false && getform_enddate_month().len() > 0)
		// 	&& (isNull(getform_enddate_year()) == false && getform_enddate_year().len() > 0)
		// ) {
		// 	variables.enddate = createDate(
		// 		year = getform_enddate_year(),
		// 		month = getform_enddate_month(),
		// 		day = getform_enddate_day());
		// }

		var endTimeHour = getform_endtime_hour().len() > 0 ? getform_endtime_hour() : 0;
		var endTimeMinute = getform_endtime_minute().len() > 0 ? getform_endtime_minute() : 0;
		var endTimeSecond = getform_endtime_second().len() > 0 ? getform_endtime_second() : 0;
		if (endTimeHour + endTimeMinute + endTimeSecond > 0) {
			variables.endtime = createTime(
				hour = endTimeHour,
				minute = endTimeMinute,
				second = endTimeSecond);
		}
		// if (
		// 	(isNull(getform_endtime_hour()) == false && getform_endtime_hour().len() > 0)
		// 	&& (isNull(getform_endtime_minute()) == false && getform_endtime_minute().len() > 0)
		// 	&& (isNull(getform_endtime_second()) == false && getform_endtime_second().len() > 0)
		// ) {
		// 	variables.endtime = createTime(
		// 		hour = getform_endtime_hour(),
		// 		minute = getform_endtime_minute(),
		// 		second = getform_endtime_second());
		// }

		if (getform_loggingfile().len() > 0) {
			variables.path = getDirectoryFromPath(getform_loggingfile());
			variables.file = getFileFromPath(getform_loggingfile());
		}

		if (getform_interval_frequency() == "every") {
			variables.interval = getform_interval_hours() * 3600 + getform_interval_minutes() * 60 + getform_interval_seconds();
		} else {
			variables.interval = getform_interval_frequency();
		}
	}

	this.memento = {
		defaultIncludes = ["task", "path", "file", "startdate", "starttime", "enddate", "endtime", "url", "port", 
			"interval", "timeout", "username", "password", "proxyserver", "proxyport", "proxyuser", "proxypassword", 
			"resolveurl", "publish", "valid", "paused", "autodelete", 
			"form_interval_frequency", 
			"form_startdate_day", "form_startdate_month", "form_startdate_year",
			"form_starttime_hour", "form_starttime_minute", "form_starttime_second",
			"form_enddate_day", "form_enddate_month", "form_enddate_year",
			"form_endtime_hour", "form_endtime_minute", "form_endtime_second",
			"form_interval_hours", "form_interval_minutes", "form_interval_seconds",
			"form_loggingfile", "unique"],
		defaultExcludes = [],
		neverInclude = [],
		defaults = {},
		mappers = {}
	};

	struct function getMemento(
		includes="",
		excludes="",
		struct mappers={},
		struct defaults={},
		boolean ignoreDefaults=false
	){
		var memento	= this.$getMemento(argumentCollection = arguments);
		var startDateTime = isDate(getStartDate()) == false || isDate(getStartTime()) == false ? "" : 
			createDateTime(
				getStartDate().year(), getStartDate().month(), getStartDate().day(), 
				getStartTime().hour(), getStartTime().minute(), getStartTime().second());
		var endDateTime = isDate(getEndDate()) == false || isDate(getEndTime()) == false ? "" : 
			createDateTime(
				getEndDate().year(), getEndDate().month(), getEndDate().day(), 
				getEndTime().hour(), getEndTime().minute(), getEndTime().second());
		memento.append({
			"startDateTime" = startDateTime,
			"endDateTime" = endDateTime,
			"url_with_port" = tasksService.mergeURLAndPort( getUrl(), getPort() )
		});
		return memento;
	}

}