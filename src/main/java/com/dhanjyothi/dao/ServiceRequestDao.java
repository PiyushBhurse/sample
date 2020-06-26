/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dhanjyothi.model.ServiceRequest;

public interface ServiceRequestDao extends JpaRepository<ServiceRequest, Long> {

}
