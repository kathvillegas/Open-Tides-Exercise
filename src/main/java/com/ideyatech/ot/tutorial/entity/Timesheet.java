package com.ideyatech.ot.tutorial.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.opentides.bean.BaseEntity;
import org.opentides.web.json.Views;

import com.fasterxml.jackson.annotation.JsonView;

@Entity
@Table(name="TIMESHEET")
public class Timesheet extends BaseEntity{
	@JsonView(Views.SearchView.class)
	@Temporal(TemporalType.DATE)
	@Column(name="CUTOFF_START")
	private Date cutOffStart;
	
	@JsonView(Views.SearchView.class)
	@Temporal(TemporalType.DATE)
	@Column(name="CUTOFF_END")
	private Date cutOffEnd;
	
	@JsonView(Views.SearchView.class)
	@ManyToOne
	@JoinColumn(name="EMPLOYEE_ID")
	private Employee employee;

	@JsonView(Views.SearchView.class)
	@Transient
	private String cutoff;
	
	
	public String getCutoff() {
		return cutoff;
	}

	public void setCutoff(String cutoff) {
		this.cutoff = getCutOffStart().toString() + " to " + getCutOffEnd().toString();
	}

	public Date getCutOffStart() {
		return cutOffStart;
	}

	public void setCutOffStart(Date cutOffStart) {
		this.cutOffStart = cutOffStart;
	}

	public Date getCutOffEnd() {
		return cutOffEnd;
	}

	public void setCutOffEnd(Date cutOffEnd) {
		this.cutOffEnd = cutOffEnd;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
}
