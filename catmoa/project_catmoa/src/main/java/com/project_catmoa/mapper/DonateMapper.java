package com.project_catmoa.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.DonateDto;

@Mapper
public interface DonateMapper {
	
	// 후원 금액과 후원날짜 넣기
	@Insert("INSERT INTO donation(userId, donationSum, donationDate) " + "VALUES (#{userId}, #{donationSum}, NOW()) ")
	@Options (useGeneratedKeys = true, keyColumn = "donationNo", keyProperty = "donationNo")
	void insertDonateInfo(DonateDto donate);
	
	@Select("SELECT SUM(donationSum) " + "FROM donation ")
	int DonateSum();
	
	@Select("SELECT COUNT(DISTINCT userId) " + "FROM donation ")
	int DonateId();
	
	@Select("SELECT u.nic, u.memberImg, d.userId, SUM(d.donationSum) AS sum From donation AS d "	+ "LEFT JOIN user AS u " + "ON d.userId = u.userId "
			+ "GROUP BY userId " + "ORDER BY sum DESC LIMIT 5")
	List<HashMap<String, Object>> selectDonateRank();
	
	// 후원금액 지역별 통계
	@Select("select '서울' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%서울%') " + "union all "
			+ "select '경기,인천' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%인천%' or sido like '%경기%') " + "union all "
			+ "select '강원도' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%강원%') " + "union all "
			+ "select '전라도' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%전남%' or sido like '%전북%' or sido like '%광주%') " + "union all "
			+ "select '경상도' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%경남%' or sido like '%경북%' or sido like '%부산%' or sido like '%대구%' or sido like '%울산%') " + "union all "
			+ "select '충청도' area, count(DISTINCT userId) cnt  from donation where userid in (select userId from user where sido like '%충남%' or sido like '%충북%' or sido like '%세종%' or sido like '%대전%') " + "union all "
			+ "select '제주' area, count(DISTINCT userId) cnt from donation where userid in (select userId from user where sido like '%제주%') " )
	List<HashMap<String, Object>> DonateAreaBar();
	
	
}
