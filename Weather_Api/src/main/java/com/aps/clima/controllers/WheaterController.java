package com.aps.clima.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aps.clima.dto.WheaterDto;
import com.aps.clima.entities.Wheater;
import com.aps.clima.services.WheaterService;


@RestController
@RequestMapping("/clima")
public class WheaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(WheaterController.class);
	
	@Autowired
	private WheaterService wheaterService;
	
	@GetMapping
	public ResponseEntity<Wheater> getActualWheater() {
		
		try {
			logger.info("Requisição no endpoint GET /clima");
			WheaterDto actualWeather;
			actualWeather = wheaterService.getActualWheater();
			
			logger.info("Resposta do endpoint GET /clima");
			return ResponseEntity.ok().body(actualWeather.getResults());
		} 
		catch (Exception e) {
			logger.error("Erro no endpoint endpoint GET /clima \n " + e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
		
	}
	


}
