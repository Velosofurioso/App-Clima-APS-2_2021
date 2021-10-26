package com.aps.clima.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.aps.clima.dto.WheaterDto;

@Service
public class WheaterService {
	
	public WheaterDto getActualWheater() {
		RestTemplate restTemplate = new RestTemplate();
		WheaterDto clima = restTemplate.getForObject("https://api.hgbrasil.com/weather", WheaterDto.class);
		return clima;
	}
	
	public int getAirQualityFromCity(String cityName) {
		RestTemplate restTemplate = new RestTemplate();
		int value = 0;
		String airQuality;
		
			try {
				airQuality = restTemplate.getForObject("https://api.waqi.info/feed/" 
						+ URLEncoder.encode(cityName, "UTF-8").replace("+", "%20") + "/?token=e562b00f25a8dd06fbabe22d3cc5beb87b7b2ef0", String.class);
				
				if(airQuality != null && airQuality.contains("aqi")) {
					airQuality = airQuality.substring(airQuality.indexOf("aqi"), airQuality.indexOf(",", 21));
					value = Integer.parseInt(airQuality);
				}
				
			} 
			
			catch (RestClientException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			return value;
	}

}
