package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
    private int paymentNo;		 	// 결제내역 NO(PK)
    private String paymentType;	 	// 결제 수단
    private Date paymentDate;	 	// 결제일
    private int paymentPrice;	 	// 결제금액
    private String paymentImpUid;	// Imp_Uid
}
