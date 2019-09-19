component {

	property name="messagebox" inject="messagebox@cbmessagebox";
	property name="tasksDao" inject="tasksDao@scheduledtasks";
	property name="tasksService" inject="tasksService@scheduledtasks";

	function index( event, rc, prc ) {
		param rc.task = "";
		schedule action="list" returnvariable="prc.serverTasks";
		prc.tasks = [];
		for ( var task in prc.serverTasks ) {
			var bean = getInstance( "taskDto@scheduledtasks" );
			populateModel( model=bean, memento=task, ignoreEmpty=true );
			prc.tasks.append( bean.getMemento() );
		}
	}

	function edit( event, rc, prc ) {
		param rc.form_mode = "edit";
		var taskName = tasksService.getTaskNameByHash( rc.task );
		var taskServer = tasksDao.getByName( taskName );
		var bean = getInstance( "taskDto@scheduledtasks" );
		populateModel( model=bean, qry=taskServer, ignoreEmpty=true );
		bean.populateFormProperties();
		prc.task = bean.getMemento();
		prc.now = dateTimeFormat( now(), "yyyy-mm-dd h:nn:ss tt" )
		event.setView( "home/form" );
	}

	function new( event, rc, prc ) {
		param rc.form_mode = "new";
		var bean = getInstance( "taskDto@scheduledtasks" );
		prc.task = bean.getMemento();
		prc.now = dateTimeFormat( now(), "yyyy-mm-dd h:nn:ss tt" )
		event.setView("home/form");
	}

	function save(event, rc, prc) {
		var bean = getInstance( "taskDto@scheduledtasks" );
		populateModel( model=bean, ignoreEmpty=true );
		bean.populateFromForm();
		vResults = validateModel( bean );
		if ( vResults.hasErrors() ) {
			savecontent variable="exceptionError" {
				writeoutput( "<ul>" );
				for ( var field in vResults.getAllErrorsAsStruct() ) {
					for ( var error in vResults.getAllErrorsAsStruct()[field] ) {
						writeoutput( "<li>#field#: #error.message#</li>" );
					}
				}
				writeoutput( "</ul>" );
			}
			variables.messagebox.error( "<p>There was a problem saving the batch.</p>
				<p>Errors:</p>
				#exceptionError#" );

		} else {
			try {
				tasksDao.update( bean.getMemento() );
				variables.messagebox.success( "<p>The task '" & bean.getTask() & "' has been successfully updated.</p>" );
				relocate( event="scheduledtasks.home.index", queryString="task=#bean.getTask()#" );
			} catch ( any e ) {
				savecontent variable="exceptionError" {
					writedump( e );
				}
				variables.messagebox.error( "<p>There was a problem saving this task.</p>
					<p>Error: #exceptionError#</p>" );
			}
		}
		if ( variables.messagebox.hasMessageType("error") == true ) {
			var bean = getInstance( "taskDto@scheduledtasks" );
			prc.task = bean.getMemento();
			prc.now = dateTimeFormat( now(), "yyyy-mm-dd h:nn:ss tt" )
			event.setView( "home/form" );
		}
	}

	function togglePaused( event, rc, prc ) {
		param rc.task = "";
		param rc.action = "";
		var taskPausedStatus = javacast( "null", 0 );
		if ( rc.task.len() > 0 && rc.action.len() > 0 ) {
			var taskName = tasksService.getTaskNameByHash( rc.task );
			if ( taskName.len() > 0 ) {
				schedule task=taskName action=rc.action;
				var task = tasksDao.getByName( taskName );
				taskPausedStatus = task.paused;
			}
		}
		return { "paused": taskPausedStatus };
	}

	function delete( event, rc, prc ) {
		param rc.task = "";
		if ( rc.task.len() > 0 ) {
			var taskName = tasksService.getTaskNameByHash( rc.task );
			if ( taskName.len() > 0 ) {
				schedule task=taskName action="delete";
				variables.messagebox.success( "<p>The task '" & taskName & "' has been successfully deleted.</p>" );
			}
		}
		relocate( event="scheduledtasks.home.index" );
	}

}