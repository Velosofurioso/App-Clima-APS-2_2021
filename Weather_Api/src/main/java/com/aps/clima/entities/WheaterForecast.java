package com.aps.clima.entities;

import java.io.Serializable;

public class WheaterForecast implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String date;
	private String weekday;
	private int max;
	private int min;
	private String description;
	private String condition;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	@Override
	public String toString() {
		return "WheaterForecast [date=" + date + ", weekday=" + weekday + ", max=" + max + ", min=" + min
				+ ", description=" + description + ", condition=" + condition + "]";
	}
	

}
