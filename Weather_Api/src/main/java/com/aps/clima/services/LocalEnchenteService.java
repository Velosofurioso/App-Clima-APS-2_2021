package com.aps.clima.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aps.clima.entities.LocalEnchente;
import com.aps.clima.repositorys.LocalEnchenteRepository;

@Service
public class LocalEnchenteService {
	
	@Autowired
	private LocalEnchenteRepository leRepository;
	
	public LocalEnchente addLocalEnchente(LocalEnchente local) throws Exception  {
		LocalEnchente oldLe = leRepository.findByCep(local.getLocal().getCep());
		
		if(oldLe != null) {
			oldLe.setReportCount(oldLe.getReportCount() + 1);
			return leRepository.save(oldLe);
		}
		else {
			local.setReportCount(1);
			return leRepository.save(local);
		}
	}
	
	public LocalEnchente findLocalById(Long id) throws Exception  {
		Optional<LocalEnchente> local = leRepository.findById(id);
		return local.get();
	}
	
	public List<LocalEnchente> findAll() throws Exception  {
		return leRepository.findByGreaterToSmaller();
	}
	
	

}
