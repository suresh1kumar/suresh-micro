package com.springboot.admissions.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.admissions.app.model.Patient;

@Repository
public interface AdmissionsReposatory extends CrudRepository<Patient, Long>{

}
