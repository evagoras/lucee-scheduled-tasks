# Lucee Administrator Scheduled Tasks Bootstrap UI
This is a ColdBox module for creating a front-end user interface based on Bootstrap 4 and jQuery that manages the server scheduled tasks, copying the Lucee Administrator functionality within a ColdBox app.

## Installation
Run the following commands from CommandBox at the root of your ColdBox site.

Install from ForgeBox:
```
install lucee-scheduled-tasks
```

Install directly from Github:
```
install evagoras/lucee-scheduled-tasks
```

## Layout
The module uses your application's default main layout by inheritance. If you want to create a custom layout then rename the file `/layouts/Main-RenameToUse.cfm` and adjust it to your liking.

## Interface

### List of Tasks
http://localhost/scheduledtasks
<img src="https://github.com/evagoras/lucee-scheduled-tasks/blob/master/includes/lucee-scheduled-tasks-list.png" 
	alt="List of Tasks">

### Add a New Task
http://localhost/scheduledtasks/home/new
<img src="https://github.com/evagoras/lucee-scheduled-tasks/blob/master/includes/lucee-scheduled-tasks-new.png" 
	alt="Add a New Task">
