package com.dhanjyothi.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "user")
@Getter
@Setter
@ToString
public class User {

	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userId;

	@Column(name = "user_name", length = 100, nullable = false, unique = true, updatable = false)
	private String username;

	@Column(name = "password", length = 50, nullable = false)
	private String password;

	@Column(name = "user_role", updatable = false, columnDefinition = "CHAR(1) NOT NULL COMMENT 'C = Customer,M = Manager'")
	private char userRole;

	@Column(name = "user_status", updatable = true, columnDefinition = "CHAR(1) NOT NULL COMMENT 'N = New,A = Active'")
	private char userStatus;

	@Column(name = "first_name", length = 100, nullable = false)
	private String firstName;

	@Column(name = "last_name", length = 100, nullable = false)
	private String lastName;

	@Column(name = "dob", columnDefinition = "DATE NOT NULL")
	private Date dob;

	@Column(name = "add_line1", length = 255, nullable = false)
	private String addLine1;

	@Column(name = "add_line2", length = 255, nullable = false)
	private String addLine2;

	@Column(name = "city", length = 50, nullable = false)
	private String city;

	@Column(name = "state", length = 50, nullable = false)
	private String state;

	@Column(name = "pin", length = 6, nullable = false)
	private int pin;

	@Column(name = "mobile_number", length = 10, nullable = false)
	private String mobileNumber;

	@Column(name = "email_id", length = 100, nullable = false)
	private String emailId;

	@Column(name = "aadhar_id", length = 16, nullable = true)
	private Long aadharId;

	@Column(name = "pan", length = 10, nullable = true)
	private String pan;

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
	@OneToMany(cascade = CascadeType.ALL, targetEntity = KYC.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
//    @JsonIgnore
	private List<KYC> kycData;

	public User() {
//        this.kycData = new ArrayList<>();
	}

}
