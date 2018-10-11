package gov.nci.planet;

import java.net.*;
import java.io.*;

public class CaptchaValidator {
	public CaptchaValidator() {
	}

	public Boolean getPlanetRecaptchaResponse(String g_recaptcha_response) {
		String secret = "@CaptchaKey@";
		String url = "https://www.google.com/recaptcha/api/siteverify?secret=" + secret + "&response="
				+ g_recaptcha_response;
		String response = "";
		Boolean valid = false;

		try {
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer gresponse = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				gresponse.append(inputLine);
			}
			in.close();
			response = gresponse.toString();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		if (response.startsWith("{  \"success\": true")) {
			valid = true;
		}

		return valid;
	}
}