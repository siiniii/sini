package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.dto.IntroDto;

public interface IntroService {
	
		// 1. 회원 가입 : 회원 데이터를 받아서 필요한 처리
		void registerUser(IntroDto user);
		
		// 2. 로그인 : 아이디, 패스워드를 받아서 데이터베이스 조회 후 결과 반환
		IntroDto findIntroByIdAndPasswd(String user_Id, String passwd);
		
		// 3. 아이디 중복 검사 -> 데이터베이스 조회 후 결과 반환
		IntroDto findRegisterUserId(String user_Id);
		
		// 4. 닉네임 중복 검사 -> DB 조회 후 결과 반환
		IntroDto findRegisterUsernic(String nic);
		
		// 프로필이미지 저장
		void updateProfileImg(String fileName, String userId);
		
		// 내정보 수정
		void updatemembersujung(IntroDto user);
		
		// 내정보 삭제
		void deletemember(String userId);
		
		//친구목록 가져오기
		List<IntroDto> findAllUser();
	}