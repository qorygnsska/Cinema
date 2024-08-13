package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventDTO {
	private int eventNo;
	private String eventName;
	private String eventDate;
	private String eventTitleImage;
	private String eventSubImage;
}
