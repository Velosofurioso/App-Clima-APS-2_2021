package com.aps.clima.services;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aps.clima.entities.Cep;

@Service
public class CepService {
	
	public Cep getEnderecoByCep(String cep) {
		RestTemplate restTemplate = new RestTemplate();
		Cep endereco = restTemplate.getForObject("https://viacep.com.br/ws/"+cep+"/json/", Cep.class);
		return endereco;
	}

}
