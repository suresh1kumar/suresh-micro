package com.springboot.admissions.app.service;

import java.util.List;

import com.springboot.admissions.app.model.Patient;

public interface AdmissionsService {
	
	public List<Patient> getPatients();
	
	public Patient getPatientById(long id);
	 
	public Patient updatePatient(Patient patient);
	//public Patient updatePatient(long id);
	
	public Patient savePatients(Patient patient);
	 
	public void deletePatient(long id);

}
