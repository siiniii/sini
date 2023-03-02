package com.project_catmoa.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.IntroDto;

@Mapper
public interface DashboardMapper {
	
	// 회원별 거주지
	@Select("select '서울' area, (count(userId)  / (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%서울%') " + "union all "
			+ "select '경기,인천' area, (count(userId) / (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%인천%' or sido like '%경기%') " + "union all "
			+ "select '강원도' area, (count(userId)/ (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%강원%') " + "union all "
			+ "select '전라도' area, (count(userId) / (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%전남%' or sido like '%전북%' or sido like '%광주%') " + "union all "
			+ "select '경상도' area, (count(userId)/ (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%경남%' or sido like '%경북%' or sido like '%부산%' or sido like '%대구%' or sido like '%울산%') " + "union all "
			+ "select '충청도' area, (count(userId)/ (SELECT COUNT(userId) FROM user) ) * 100 cnt  from user where userid in (select userId from user where sido like '%충남%' or sido like '%충북%' or sido like '%세종%' or sido like '%대전%') " + "union all "
			+ "select '제주' area, (count(userId)/ (SELECT COUNT(userId) FROM user) ) * 100 cnt from user where userid in (select userId from user where sido like '%제주%') " )
	List<HashMap<String, Object>> userAreaBar();
	
	// 회원별 연령대
	@Select("SELECT '미성년자' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 2 " + "union all " +
			 "SELECT '20대' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 3 " + "union all " +
			 "SELECT '30대' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 4 " + "union all " +
			 "SELECT '40대' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 5 " + "union all " +
			 "SELECT '50대' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 6 " + "union all " +
			 "SELECT '60대' age, (COUNT(age) / (SELECT COUNT(age) FROM user) ) * 100 cnt FROM user where age = 7 " + "union all " +
			 "SELECT '70대 이상' age, COUNT(age) cnt FROM user where age = 8 ")
	List<HashMap<String, Object>> userAge();
	
	
	// 회원별 유입경로
	@Select("SELECT 'SNS' inflowcode, (COUNT(inflowCode) / (SELECT COUNT(inflowCode) FROM user) ) * 100 cnt FROM user where inflowCode = 1 " + "union all " + 
			"SELECT 'youtube' inflowcode, (COUNT(inflowCode) / (SELECT COUNT(inflowCode) FROM user) ) * 100 cnt FROM user where inflowCode = 2 " + "union all " +
			"SELECT '인터넷' inflowcode, (COUNT(inflowCode) / (SELECT COUNT(inflowCode) FROM user) ) * 100 cnt FROM user where inflowCode = 3 " + "union all " +
			"SELECT '지인소개' inflowcode, (COUNT(inflowCode) / (SELECT COUNT(inflowCode) FROM user) ) * 100 cnt FROM user where inflowCode = 4 " )
	List<HashMap<String, Object>> userInflowCode();
	
	
	// 회원 성별
		@Select("SELECT '남자' gender, (COUNT(sex) / (SELECT COUNT(sex) FROM user) ) * 100 cnt FROM user where sex = 1 " + "union all " + 
				"SELECT '여자' gender, (COUNT(sex) / (SELECT COUNT(sex) FROM user) ) * 100 cnt FROM user where sex = 2 " )
		List<HashMap<String, Object>> userGender();
	
	
}
