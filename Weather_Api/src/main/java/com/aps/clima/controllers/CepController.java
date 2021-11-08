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

import com.aps.clima.entities.Cep;
import com.aps.clima.services.CepService;

@RestController
@RequestMapping("/cep")
public class CepController {
	
	@Autowired
	private CepService cepService;
	
	 private static final Logger logger = LoggerFactory.getLogger(CepController.class);
	
	@GetMapping(value="/{cep}")
	public ResponseEntity<Cep> getEnderecoByCep(@PathVariable @Validated String cep) {
		try {
			logger.info("Requisição no endpoint GET /cep/{id}");
			Cep endereco = cepService.getEnderecoByCep(cep);
			
			logger.info("Resposta do endpoint GET /cep/{id} \n");
			return ResponseEntity.ok().body(endereco);
		}
		
		catch(Exception e) {
			logger.error("Erro no endpoint endpoint GET /cep/{id} \n " + e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}

}
