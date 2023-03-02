package com.project_catmoa.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data // 모든 변수에 대해 getter, setter 자동 생성, 기본 생성자, toString, ....
public class IntroDto {
	
	@NotBlank(message="이름을 입력하세요 ")
	@Pattern(regexp="[A-Za-z|가-힣]{2,}", message = "이름은 2자 이상이어야 합니다 ")
	private String name;
	@NotBlank(message="아이디를 입력하세요")
	@Pattern(regexp="[A-Za-z]+[0-9]+", message = "아이디는 6~20개의 영문자 숫자 조합입니다.")
	private String userId;
	@NotBlank(message="닉네임을 입력하세요")
	@Pattern(regexp="[A-Za-z|가-힣|0-9]{2,}" , message = "닉네임은 특수문자없는 2~10자리여야 합니다.")
	private String nic;
	@NotBlank(message="비밀번호를 입력하세요")
	@Pattern(regexp="[A-Za-z0-9+]+[@!#$]{1,}", message = "비밀번호는 6~20개의 영문자+특수문자여야 합니다")
	private String passwd;
	private int firstPhone;
	private String middlePhone;
	private String lastPhone;
	private String zipcode;
	private String addressType;
	private String address;
	private String sido;
	private String gugun;
	private String dong;
	private String userdetail;
	private String sex;
	private int age;
	private int admin;
	private int inflowCode;
	private String memberImg;

}
