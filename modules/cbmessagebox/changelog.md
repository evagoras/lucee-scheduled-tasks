# CHANGELOG

## 3.0.2

* Updated location protocol for download

## 3.0.1

* Patch for not sending styles to headers to avoid collisions on test modes

## 3.0.0

* Update to new module layout
* Adding support for `success` alert message boxes. Updating throw details to correct inconsistency (https://github.com/coldbox-modules/cbmessagebox/pull/11) thanks to @zakarym
* Removed legacy icons and left just messageboxes with modern css styles
* Added new messagebox type: `dark` for a nice dark tone
* Update all css to more modern look and feel

## 2.2.1

* Updates to unified workbench
* Fixes on warning messages showing as infos

## 2.2.0

* New function `hasMessageType` returns true if the messagebox has a message of the specified type.
* Fix on `getData()` to clear the message correctly.
* Travis updates

## 2.1.0 

* Travis updates
* DocBox Updates
* Build Process updates

## 2.0.0

* Updated build process to use new DocBox
* Updated build process to leverage CommandBox for dependencies
* Fixes missing template exception when modules directory is not in root
* Migrated to pure script
* Updated void functions to return MessageBox for chaining.
* Made default types changeable via prepend and append array methods
* Change all internal instance properties to accessible getter/setter properties. This will allow for overriding of all internal state variables

## 1.0.0

* Create first module version