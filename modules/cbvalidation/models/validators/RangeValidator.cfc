/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
This validator validates if an incoming value exists in a range of values
*/
component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton{

	property name="name";

	RangeValidator function init(){
		name = "Range";
		return this;
	}

	/**
	* Will check if an incoming value validates
	* @validationResultThe result object of the validation
	* @targetThe target object to validate on
	* @fieldThe field on the target object to validate on
	* @targetValueThe target value to validate
	* @validationDataThe validation data the validator was created with
	*/
	boolean function validate(required cbvalidation.models.result.IValidationResult validationResult, required any target, required string field, any targetValue, any validationData){
		// check
		if( !isValid("string",arguments.validationData) || !isValid("regex",arguments.validationData,"(\-?\d)+\.\.\-?\d+")){
			throw(message="The Required validator data needs to be boolean and you sent in: #arguments.validationData#",type="RequiredValidator.InvalidValidationData");
		}

		var min = listFirst( arguments.validationData,'..');
		var max = "";
		if( find("..",arguments.validationData) ){
			max = listLast( arguments.validationData,'..');
		}

		// simple value range evaluations?
		if( !isNull(arguments.targetValue) AND targetValue >= min AND ( !len(max) OR targetValue <= max ) ) {
			return true;
		}

		var args = {message="The '#arguments.field#' value is not the value field range (#arguments.validationData#)",field=arguments.field,validationType=getName(),validationData=arguments.validationData};
		var error = validationResult.newError(argumentCollection=args).setErrorMetadata({range=arguments.validationData,min=min,max=max});
		validationResult.addError( error );
		return false;
	}

	/**
	* Get the name of the validator
	*/
	string function getName(){
		return name;
	}

}