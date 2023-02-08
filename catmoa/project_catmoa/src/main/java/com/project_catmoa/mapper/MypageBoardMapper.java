package com.project_catmoa.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.BoardDto;

@Mapper
public interface MypageBoardMapper {

	@Select("SELECT boardNo, userId, boardTitle, writeTime " +
			"FROM boardCommon " +
			"WHERE userId = #{ userId } ")
	List<BoardDto> selectMypageBoard(String userId);

}
