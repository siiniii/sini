package com.project_catmoa.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MessageDto {
	
	private int msgNo;
	private String msgTitle;
	private String msgContent;
	private Date sendDate;
	private int recvChk;
	private String sendNic;
	private String recvNic;
	
	private List<MessageAttachDto> attachments;
	
}
