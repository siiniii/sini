package com.project_catmoa.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.JjimDto;

@Mapper
public interface JjimMapper {
	@Insert("INSERT INTO jjimList(boardNo, userId, jjimDate) " + "VALUES (#{boardNo}, #{userId}, NOW()) ")
	void insertJjimInfo(JjimDto jjimDto);
	
	@Delete("DELETE FROM jjimList WHERE boardNo = #{ boardNo } and userId = #{ userId }")
	void deleteJjimInfo(JjimDto jjimDto);
	
	@Select("SELECT COUNT(*) FROM jjimList  WHERE boardNo = #{ boardNo } and userId = #{ userId }")
	int selectCountJjimByUserIdAndBoardNo(JjimDto jjimDto);
	
	
}
