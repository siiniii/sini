package com.project_catmoa.service;

import java.util.List;

import com.project_catmoa.common.Util;
import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.mapper.IntroMapper;

import lombok.Setter;

public class IntroServiceImpl implements IntroService {
	
	@Setter
	private IntroMapper introMapper;
	
	// 1. 회원 가입 : 회원 데이터를 받아서 필요한 처리
	@Override
	public void registerUser(IntroDto user) {
		
		String passwd = Util.getHashedString(user.getPasswd(), "SHA-256");
		user.setPasswd(passwd); // 암호화된 패스워드를 멤버에 저장
		introMapper.registerUser(user);
		
	}
	
	// 2. 로그인 : 아이디, 패스워드를 받아서 데이터베이스 조회 후 결과 반환
	@Override
	public IntroDto findIntroByIdAndPasswd(String userId, String passwd) {
		
		passwd = Util.getHashedString(passwd, "SHA-256");
		IntroDto introDto = introMapper.selectIntroByIdAndPasswd(userId, passwd);
		return introDto;
		
	}
	
	// 아이디 중복 검사
	@Override
	public IntroDto findRegisterUserId(String userId) {
		
		IntroDto introDto = introMapper.selectRegisterUserId(userId);
		return introDto;
	}
	
	// 닉네임 중복 검사
	@Override
	public IntroDto findRegisterUsernic(String nic) {
		
		IntroDto introDto = introMapper.selectRegisterUsernic(nic);
		return introDto;
	}

	@Override
	public void updateProfileImg(String fileName, String userId) {
		introMapper.updateProfileImg(fileName, userId);
	}

	@Override
	public void updatemembersujung(IntroDto user) {
		introMapper.updatemembersujung(user);
		
	}

	@Override
	public void deletemember(String userId) {
		introMapper.deletemember(userId);
	}

	@Override
	public List<IntroDto> findAllUser() {
		List<IntroDto> allUser = introMapper.selectAllUserId();
		return allUser;
	}
}
