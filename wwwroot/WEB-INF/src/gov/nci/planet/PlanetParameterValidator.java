/*
 * Author: Tanuj Shroff
 * Date: April 21, 2009
*/

package gov.nci.planet;

import gov.nci.validator.ParameterValidator;

public class PlanetParameterValidator extends ParameterValidator {

	private static String fipsPattern = "^[A-Za-z]*$";
	private static String partnerTopicPattern = "^[A-Z]$";
	private static String researcherTopicPattern = "^[0-9]*$";
	
	public static boolean validateStateAbbreviation(String stateAbbr) {
		int minLength = 2;
		int maxLength = 2; 
		
		boolean validated = validateRequired(stateAbbr)
			&& validatePattern(stateAbbr, fipsPattern)
			&& validateLength(stateAbbr, minLength, maxLength);
		
		return validated;
	}

	// This is used for partner topics
	public static boolean validatePartnerTopic(String topic) {
		int minLength = 1;
		int maxLength = 1; 
		
		boolean validated = validateRequired(topic)
			&& validatePattern(topic, partnerTopicPattern)
			&& validateLength(topic, minLength, maxLength);
		
		return validated;
	}
	
	// This is used for researcher topics
	public static boolean validateResearcherTopic(Integer topic) {
		int minLength = 1;
		int maxLength = 2; 
		boolean validated = Boolean.FALSE;
		
		if (null != topic) {
			String topicString = topic.toString();
			validated = validateRequired(topicString)
				&& validatePattern(topicString, researcherTopicPattern)
				&& validateLength(topicString, minLength, maxLength);
		}
		
		return validated;
	}
}
