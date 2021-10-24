package com.aps.clima.dto;

import java.io.Serializable;

import com.aps.clima.entities.Wheater;

public class WheaterDto implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String by;
	private boolean valid_key;
	
	private Wheater results;
	
	private double execution_time;
	private boolean from_cache;
	
	public String getBy() {
		return by;
	}
	public void setBy(String by) {
		this.by = by;
	}
	public boolean isValid_key() {
		return valid_key;
	}
	public void setValid_key(boolean valid_key) {
		this.valid_key = valid_key;
	}
	public Wheater getResults() {
		return results;
	}
	public void setResults(Wheater results) {
		this.results = results;
	}
	public double getExecution_time() {
		return execution_time;
	}
	public void setExecution_time(double execution_time) {
		this.execution_time = execution_time;
	}
	public boolean isFrom_cache() {
		return from_cache;
	}
	public void setFrom_cache(boolean from_cache) {
		this.from_cache = from_cache;
	}
	
	@Override
	public String toString() {
		return "WheaterDto [by=" + by + ", valid_key=" + valid_key + ", results=" + results + ", execution_time="
				+ execution_time + ", from_cache=" + from_cache + "]";
	}
	

}
