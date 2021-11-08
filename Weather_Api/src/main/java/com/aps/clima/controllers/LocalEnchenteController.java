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

import com.aps.clima.entities.LocalEnchente;
import com.aps.clima.services.LocalEnchenteService;

@RestController
@RequestMapping("/report-enchente")
public class LocalEnchenteController {
	
	private static final Logger logger = LoggerFactory.getLogger(LocalEnchenteController.class);
	
	@Autowired
	private LocalEnchenteService leService;
	
	@PostMapping(path="/add")
	public ResponseEntity<LocalEnchente> addEnchenteReport(@RequestBody LocalEnchente data) {	
		try {
			logger.info("Requisição no endpoint POST /report-enchente/add");
			
			data.setDataOcorrida(new Date());
			data = leService.addLocalEnchente(data);
			
			logger.info("Resposta do endpoint POST /report-enchente/add");
			return ResponseEntity.status(HttpStatus.CREATED).body(data);
			
		} catch (Exception e) {
			logger.error("Erro no endpoint POST /report-enchente/add \n " + e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
		
		
	}
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<LocalEnchente> getReportByID(@PathVariable @Validated Long id) {
		
		try {
			logger.info("Requisição no endpoint GET /report-enchente/{id}");
		
			LocalEnchente le;
			le = leService.findLocalById(id);
			
			logger.info("Resposta do endpoint GET /report-enchente/{id}");
			return ResponseEntity.ok().body(le);
		} 
		
		catch (Exception e) {
			logger.error("Erro no endpoint endpoint GET /report-enchente/{id} \n " + e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
		
	}
	
	@GetMapping
	public ResponseEntity<List<LocalEnchente>> getAllReports() {
		try {
			logger.info("Requisição no endpoint GET /report-enchente");
			
			List<LocalEnchente> les;
			les = leService.findAll();
			
			logger.info("Resposta do endpoint GET /report-enchente");
			return ResponseEntity.ok().body(les);
		} 
		
		catch (Exception e) {
			logger.error("Erro no endpoint endpoint GET /report-enchente \n " + e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}


}
