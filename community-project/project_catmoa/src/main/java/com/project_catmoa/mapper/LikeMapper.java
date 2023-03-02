package com.project_catmoa.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.LikeDto;

@Mapper
public interface LikeMapper {
	@Insert("INSERT INTO likeList(boardNo, userId, likeDate) " + "VALUES (#{boardNo}, #{userId}, NOW()) ")
	void insertlikeInfo(LikeDto likeDto);
	
	@Delete("DELETE FROM likeList WHERE boardNo = #{ boardNo } and userId = #{ userId }")
	void deletelikeInfo(LikeDto likeDto);
	
	@Select("SELECT COUNT(*) FROM likeList  WHERE boardNo = #{ boardNo } and userId = #{ userId }")
	int selectCountByUserIdAndBoardNo(LikeDto likeDto);
	
	
}
