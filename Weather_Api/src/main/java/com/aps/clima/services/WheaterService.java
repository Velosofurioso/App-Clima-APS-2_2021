package com.aps.clima.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aps.clima.controllers.CepController;
import com.aps.clima.dto.WheaterDto;

@Service
public class WheaterService {
	
	private static final Logger logger = LoggerFactory.getLogger(CepController.class);
	
	public WheaterDto getActualWheater() throws Exception {
		System.setProperty("https.protocols", "TLSv1.1,TLSv1.2,TLSv1");
		RestTemplate restTemplate = new RestTemplate();
		WheaterDto clima = restTemplate.getForObject("https://api.hgbrasil.com/weather", WheaterDto.class);
		
		logger.info("RETORNO DO WEB SERVICE CLIMA: \n " + clima);
		return clima; 
	}

}
