/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
The ColdBox validation error, all inspired by awesome Hyrule Validation Framework by Dan Vega
*/
component accessors="true" implements="cbvalidation.models.result.IValidationError"{

	// constructor
	ValidationError function init(){
		message 		= "";
		field 			= "";
		rejectedValue 	= "";
		validationType 	= "";
		validationData  = "";
		errorMetadata	= {};
		return this;
	}

	/**
	* Set error metadata that can be used in i18n message replacements or in views
	* @data The name-value pairs of data to store in this error.
	*/
	IValidationError function setErrorMetadata(required any data){
		errorMetadata = arguments.data;
		return this;
	}

	/**
	* Get the error metadata
	*/
	struct function getErrorMetadata(){
		return errorMetadata;
	}

	/**
	* Set the validator data
	* @data The data of the validator
	*/
	IValidationError function setValidationData(required any data){
		validationData = arguments.data;
		return this;
	}

	/**
	* Get the error validation data
	*/
	string function getValidationData(){
		return validationData;
	}


	/**
	* Set the error message
	* @message The error message
	*/
	IValidationError function setMessage(required string message){
		variables.message = arguments.message;
		return this;
	}

	/**
	* Set the field
	* @message The error message
	*/
	IValidationError function setField(required string field){
		variables.field = arguments.field;
		return this;
	}

	/**
	* Set the rejected value
	* @value The rejected value
	*/
	IValidationError function setRejectedValue(required any value){
		variables.rejectedValue = arguments.value;
		return this;
	}

	/**
	* Set the validator type name that rejected
	* @validationType The name of the rejected validator
	*/
	IValidationError function setValidationType(required any validationType){
		variables.validationType = arguments.validationType;
		return this;
	}

	/**
	* Get the error validation type
	*/
	string function getValidationType(){
		return validationType;
	}

	/**
	* Get the error message
	*/
	string function getMessage(){
		return message;
	}

	/**
	* Get the error field
	*/
	string function getField(){
		return field;
	}

	/**
	* Get the rejected value
	*/
	any function getRejectedValue(){
		return rejectedValue;
	}

	/**
	* Get the error representation
	*/
	struct function getMemento(){
		return {
			message = message,
			field = field,
			rejectedValue = rejectedValue,
			validationType = validationType,
			validationData = validationData,
			errorMetadata = errorMetadata
		};
	}


	/**
	* Configure method, which can do setters for all required error params
	* @message The required error message
	* @field The required field that case the exception
	* @rejectedValue The optional rejected value
	* @validationType The name of the rejected validator
	*/
	IValidationError function configure(
		required string message, 
		required string field, 
		string rejectedValue, 
		string validationType, 
		any validationData
	){
		for( var key in arguments ){
			if( structKeyExists( arguments, key ) ){ variables[ key ] = arguments[ key ]; }
		}
		return this;
	}

}