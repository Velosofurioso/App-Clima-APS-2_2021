package com.aps.clima.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		WheaterDto actualWeather =  wheaterService.getActualWheater();
		return ResponseEntity.ok().body(actualWeather.getResults());
	}
	
	
	@GetMapping(value = "/air-quality/{cityName}")
	public ResponseEntity<Integer> getAirQualityFromCityName(@PathVariable @Validated String cityName) {
		int Humidity =  wheaterService.getAirQualityFromCity(cityName);
		return ResponseEntity.ok().body(Humidity);
	}

}
