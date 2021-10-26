package com.aps.clima.controllers;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aps.clima.entities.Cep;
import com.aps.clima.entities.LocalEnchente;
import com.aps.clima.services.LocalEnchenteService;

@RestController
@RequestMapping("/report-enchente")
public class LocalEnchenteController {
	
	private static final Logger logger = LoggerFactory.getLogger(LocalEnchenteController.class);
	
	@Autowired
	private LocalEnchenteService leService;
	
	@PostMapping(path="/add")
	public ResponseEntity<LocalEnchente> addEnchenteReport(@RequestBody Cep cep) {
		logger.info("");
		LocalEnchente le = new LocalEnchente(cep, new Date());
		LocalEnchente report = leService.addLocalEnchente(le);
		return ResponseEntity.status(HttpStatus.CREATED).body(report);
	}
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<LocalEnchente> getReportByID(@PathVariable @Validated Long id) {
		LocalEnchente le =  leService.findLocalById(id);
		return ResponseEntity.ok().body(le);
	}
	
	@GetMapping
	public ResponseEntity<List<LocalEnchente>> getAllReports() {
		List<LocalEnchente> les =  leService.findAll();
		return ResponseEntity.ok().body(les);
	}


}
