package com.aps.clima.services;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aps.clima.dto.WheaterDto;

@Service
public class WheaterService {
	
	public WheaterDto getActualWheater() {
		RestTemplate restTemplate = new RestTemplate();
		WheaterDto clima = restTemplate.getForObject("https://api.hgbrasil.com/weather", WheaterDto.class);
		return clima;
		
	}

}
