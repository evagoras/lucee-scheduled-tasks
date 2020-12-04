component {

	// Module Properties
	this.title 				= "Lucee Scheduled Tasks";
	this.author 			= "Evagoras Charalambous";
	this.webURL 			= "https://github.com/evagoras/lucee-scheduled-tasks";
	this.description 		= "A UI Bootstrap implementation of the Lucee Web Tasks";
	this.version			= "1.0.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= false;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "scheduledtasks";
	// Inherit Entry Point
	this.inheritEntryPoint 	= false;
	// Model Namespace
	this.modelNamespace		= "scheduledtasks";
	// CF Mapping
	this.cfmapping			= "scheduledtasks";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= ["cbvalidation", "mementifier", "cbmessagebox"];

	function configure() {

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="home", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];

		mementifier = {
			// Turn on to use the ISO8601 date/time formatting on all processed date/time properites, else use the masks
			iso8601Format = false,
			// The default date mask to use for date properties
			dateMask      = "yyyy-MM-dd",
			// The default time mask to use for date properties
			timeMask      = "HH:mm:ss",
			// Enable orm auto default includes: If true and an object doesn't have any `memento` struct defined
			// this module will create it with all properties and relationships it can find for the target entity
			// leveraging the cborm module.
			ormAutoIncludes = true
		};

	}

}