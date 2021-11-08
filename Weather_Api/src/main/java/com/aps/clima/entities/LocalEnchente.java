package com.aps.clima.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "local_enchente")
public class LocalEnchente {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false)
	private Long id;
	
	@Embedded
	private Cep local;
	
	private String nivelDeAgua;
	
	private Date dataOcorrida;
	
	@Column(nullable = true)
	private int reportCount;
	
	
	public LocalEnchente(Cep local, String nivelDeAgua, Date dataOcorrida) {
		super();
		this.local = local;
		this.nivelDeAgua = nivelDeAgua;
		this.dataOcorrida = dataOcorrida;
	}
	
	public LocalEnchente(Cep local, Date dataOcorrida) {
		super();
		this.local = local;
		this.dataOcorrida = dataOcorrida;
	}
	
	public LocalEnchente() {}

	public Cep getLocal() {
		return local;
	}

	public void setLocal(Cep local) {
		this.local = local;
	}

	public String getNivelDeAgua() {
		return nivelDeAgua;
	}

	public void setNivelDeAgua(String nivelDeAgua) {
		this.nivelDeAgua = nivelDeAgua;
	}

	public Date getDataOcorrida() {
		return dataOcorrida;
	}

	public void setDataOcorrida(Date dataOcorrida) {
		this.dataOcorrida = dataOcorrida;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
	

}
