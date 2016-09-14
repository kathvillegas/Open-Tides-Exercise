package com.ideyatech.ot.tutorial.entity;

import java.text.SimpleDateFormat;
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
@Table(name="DTR")
public class DailyTimeRecord extends BaseEntity{
	@JsonView(Views.SearchView.class)
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_IN")
	private Date timeIn;
	
	@JsonView(Views.SearchView.class)
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_OUT")
	private Date timeOut;
	
	@JsonView(Views.SearchView.class)
	@ManyToOne
	@JoinColumn(name="TIMESHEET_ID")
	private Timesheet timesheet;
	
	@JsonView(Views.SearchView.class)
	@ManyToOne
	@JoinColumn(name = "EMPLOYEE_ID")
	private Employee employee;
	
	@Column(name = "EMPLOYEE_ID", insertable = false, updatable = false)
	private Long employeeId;
	
	@Transient
	private int overtime;

	public Date getTimeIn() {
		return timeIn;
	}

	public void setTimeIn(Date timeIn) {
		this.timeIn = timeIn;
	}

	public Date getTimeOut() {
		return timeOut;
	}

	public void setTimeOut(Date timeOut) {
		this.timeOut = timeOut;
	}

	public Timesheet getTimesheet() {
		return timesheet;
	}

	public void setTimesheet(Timesheet timesheet) {
		this.timesheet = timesheet;
	}

	public int getOvertime() {
		return overtime;
	}

	public void setOvertime(int overtime) {
		this.overtime = totalHours() - 9;
	}
	
	public int totalHours(){
		long diff = timeOut.getTime() - timeIn.getTime();
		int totalHours = (int) (diff / (60 * 60 * 1000));
		return totalHours;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getTimeOutWithTime() {
		if(getTimeOut() != null) {
			return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(getTimeOut());
		}
		return "";
	}
	
	public String getTimeInWithTime() {
		if(getTimeIn() != null) {
			return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(getTimeIn());
		}
		return "";
	}
	
}
