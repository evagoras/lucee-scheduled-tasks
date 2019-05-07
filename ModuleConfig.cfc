component {

	// Module Properties
	this.title 				= "Lucee Scheduled Tasks";
	this.author 			= "Evagoras Charalambous";
	this.webURL 			= "https://github.com/evagoras/lucee-scheduled-tasks";
	this.description 		= "A UI Bootstrap implementation of the Lucee Web Tasks";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= false;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = false;
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
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {

		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="home", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];

		// SES Resources
		resources = [
			// { resource = "" }
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
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
		}

		// Binder Mappings
		// binder.map("Alias").to("#moduleMapping#.models.MyService");

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}