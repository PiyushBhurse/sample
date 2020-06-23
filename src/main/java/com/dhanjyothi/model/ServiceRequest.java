/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "service_request")
@Getter
@Setter
@ToString
public class ServiceRequest {

    @Id
    @Column(name = "req_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long reqId;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "acct_id")
    private Account owner;

    @Column(name = "req_desc", length = 255, nullable = false)
    private String reqDesc;
}
