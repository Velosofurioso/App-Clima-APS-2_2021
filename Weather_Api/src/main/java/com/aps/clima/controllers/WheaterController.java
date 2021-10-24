package com.aps.clima.controllers;

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
	
	@Autowired
	private WheaterService wheaterService;
	
	@GetMapping
	public ResponseEntity<Wheater> getActualWheater() {
		WheaterDto actualWeather =  wheaterService.getActualWheater();
		return ResponseEntity.ok().body(actualWeather.getResults());
	}

}
