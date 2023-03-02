package com.project_catmoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project_catmoa.dto.IntroDto;

import lombok.Delegate;

@Mapper
public interface IntroMapper {
	
	@Insert	("INSERT INTO user( name, userId, nic, passwd, firstPhone, middlePhone, lastPhone, zipcode, address, addressType, sido, gugun, dong, userdetail, sex, age, admin, inflowCode) " +
			 "VALUES (#{ name }, #{ userId }, #{ nic }, #{ passwd }, #{ firstPhone }, #{ middlePhone }, #{ lastPhone }, #{ zipcode }, #{address}, #{addressType}, #{sido}, #{gugun}, #{dong}, #{userdetail}, #{ sex }, #{ age }, #{ admin }, #{ inflowCode })")
	void registerUser(IntroDto user);
	
	
	@Select ("SELECT name, userId, passwd, admin, nic, firstPhone, middlePhone, lastPhone, zipcode, address, userdetail, memberImg " +
			 "FROM user " +
			 "WHERE userId = #{ userId } AND passwd = #{ passwd } AND deleted = 0 ")
	IntroDto selectIntroByIdAndPasswd(@Param("userId")String userId, @Param("passwd") String passwd);
	
	//친구 목록 프로필 사진 가져오기
	@Select ("SELECT nic,memberImg " +
			 "FROM user " +
			 "WHERE deleted = 0 ")
	List<IntroDto> selectAllUserId();
	
	// 아이디 중복 검사
	@Select ("SELECT userId " +
			 "FROM user " +
			 "WHERE userId = #{ userId } ")
	IntroDto selectRegisterUserId(@Param("userId")String userId);
	
	// 닉네임 중복 검사
	@Select ("SELECT nic " +
			 "FROM user " +
			 "WHERE nic = #{ nic } ")
	IntroDto selectRegisterUsernic(@Param("nic")String nic);
	
	//프로필 파일 저장
	@Update("UPDATE user SET memberImg = #{fileName} WHERE userId = #{userId}")
	void updateProfileImg(@Param("fileName") String fileName, @Param("userId") String userId);
	
	// 내 정보 수정
	@Update("UPDATE user " + 
			"SET nic = #{nic}, zipcode = #{zipcode}, address = #{address}, userdetail = #{userdetail}, firstPhone = #{ firstPhone }, middlePhone = #{ middlePhone }, lastPhone = #{ lastPhone } " +
			"WHERE userId = #{ userId }")
	void updatemembersujung(IntroDto user );
	
	//회원 탈퇴
	
	@Update("UPDATE user " +
			"SET deleted = 1 " +
			"WHERE userId = #{ userId }")
	void deletemember( String userId );
	
	}

		
	 
		 
	

