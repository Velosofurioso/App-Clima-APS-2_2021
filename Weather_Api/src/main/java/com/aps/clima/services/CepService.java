package com.aps.clima.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aps.clima.controllers.CepController;
import com.aps.clima.entities.Cep;

@Service
public class CepService {
	
	 private static final Logger logger = LoggerFactory.getLogger(CepController.class);
	
	public Cep getEnderecoByCep(String cep) throws Exception {
		RestTemplate restTemplate = new RestTemplate();
		Cep endereco = restTemplate.getForObject("https://viacep.com.br/ws/" + cep + "/json/", Cep.class);
		logger.info("RETORNO DO WEB SERVICE: \n " + endereco);
		return endereco;
	}

}
