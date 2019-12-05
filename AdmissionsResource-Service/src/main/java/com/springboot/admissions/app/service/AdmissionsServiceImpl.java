package com.springboot.admissions.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.admissions.app.dao.AdmissionsReposatory;
import com.springboot.admissions.app.model.Patient;

@Service
public class AdmissionsServiceImpl implements AdmissionsService{

	@Autowired
	private AdmissionsReposatory admissionsReposatory;
	//@Override
	public List<Patient> getPatients() {
		// TODO Auto-generated method stub
		//return admissionsReposatory.findAll();
		return (List<Patient>) admissionsReposatory.findAll();
	}
	@Override
	public Patient getPatientById(long id) {
		// TODO Auto-generated method stub
		//return admissionsReposatory.getOne(id);
		return admissionsReposatory.findById(id).get();
	}
	@Override
	public Patient updatePatient(Patient patient) {
		// TODO Auto-generated method stub
		 return admissionsReposatory.save(patient);
	}
	@Override
	public void deletePatient(long id) {
		// TODO Auto-generated method stub
		admissionsReposatory.deleteById(id);
	}
	@Override
	public Patient savePatients(Patient patient) {
		
		return admissionsReposatory.save(patient);
		
		
	}

}
