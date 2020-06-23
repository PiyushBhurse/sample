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
import javax.persistence.Transient;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "kyc")
@Getter
@Setter
@ToString
public class KYC {

    @Id
    @Column(name = "kyc_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long kycId;

//    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id")
//    private User user;
    @Column(name = "kyc_type", columnDefinition = "CHAR(1) NOT NULL COMMENT 'B = Date of Birth, A = Proof of Addess D=AADHAR, P = PAN'")
    private char kycType;

    @Column(name = "document_desc", length = 255, nullable = false)
    private String documentDesc;

    @Column(name = "document_loc", length = 255, nullable = false)
    private String documentLoc;

    @Transient
    private MultipartFile file;

}
