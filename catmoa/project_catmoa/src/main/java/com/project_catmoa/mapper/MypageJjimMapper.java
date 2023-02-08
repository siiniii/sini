package com.project_catmoa.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.JjimDto;

@Mapper
public interface MypageJjimMapper {

	@Select("SELECT j.boardNo, j.userId, b.boardTitle, b.boardContent, a.savedFileName " + 
			"FROM jjimList j " +
			"INNER JOIN boardCommon b ON j.boardNo = b.boardNo " + 
			"LEFT OUTER JOIN boardAttachment a ON j.boardNo = a.boardNo " +
			"WHERE j.userId = #{ userId }")
	List<HashMap<String, Object>> selectMypageJjimBoard(String userId);
	
}
