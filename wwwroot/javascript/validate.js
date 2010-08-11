<!--
function validateForm(fieldNameToValidate)
{
	if (document.form1[fieldNameToValidate].value.length > 0) {
	
   		var sqlInjectionPattern = new RegExp("\\w*((\\%27)|(\\'))((\\%6F)|o|(\\%4F))((\\%72)|r|(\\%52))");
   		var crossSiteScriptingPattern = new RegExp("((\\%3C)|<)(.|\\n)*?((\\%3E)|>)");
   		var phonePattern = new RegExp("\\([0-9]{3}\\)\\s?[0-9]{3}(-|\\s)?[0-9]{4}(\\s(x\\d+)?){0,1}$|^[0-9]{3}-?[0-9]{3}-?[0-9]{4}(\\s(x\\d+)?){0,1}$");
   		var emailPattern = new RegExp("[\\w-\\.]+@(?!acme-hack)([\\w-]+\\.)+[\\w-]{2,4}$");
   		var spamConsonantsPattern = new RegExp("[^aeiouyAEIOUY0-9\\n\\ \\/\\:\\.\\,\\-]{7,}");

   		if ( (document.form1[fieldNameToValidate].value.match(sqlInjectionPattern)) ||
			 (document.form1[fieldNameToValidate].value.match(crossSiteScriptingPattern)) ) {
			window.alert("Please remove any special characters such as '<' and '>'.");
			return false;
		} else if (document.form1[fieldNameToValidate].value.match(spamConsonantsPattern)) {
			window.alert("Please check spelling and/or expand any long acronyms");
			return false;
		}		
   	} else {
    	window.alert("Please enter your comments.");
		return false;
	}

	if (document.form1.email.value.length > 0) {
		  	if (!document.form1.email.value.match(emailPattern)) {
		    	window.alert("Please enter a valid email address.");
				return false;
			}
	}
	
	if (document.form1.phone.value.length > 0) {
		  	if (!document.form1.phone.value.match(phonePattern)) {
		    	window.alert("Please enter a valid phone number (e.g., 8005551212, (800)555-1212 x1234, 800-555-1212 x123).");
				return false;
			}
	}
}
//-->