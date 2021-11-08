package com.aps.clima.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.aps.clima.entities.LocalEnchente;

public interface LocalEnchenteRepository extends JpaRepository<LocalEnchente, Long> {
	
	 @Query(value = "SELECT * FROM LOCAL_ENCHENTE ORDER BY REPORT_COUNT DESC", nativeQuery = true)
	 List<LocalEnchente> findByGreaterToSmaller();
	 
	 @Query(value = "SELECT * FROM LOCAL_ENCHENTE WHERE CEP = ?1", nativeQuery = true)
	 LocalEnchente findByCep(String cep);

}
