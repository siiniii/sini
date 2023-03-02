package com.project_catmoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.MessageBookmarkDto;

@Mapper
public interface MypageBookmarkMapper {

	// 즐겨찾기 친구 불러오기
	@Select("SELECT userNic, bookmarkNic " +
			"FROM messageBookmark " +
			"WHERE userNic = #{ loginuserNic } " +
			"ORDER BY bookmarkNic DESC ")
	List<MessageBookmarkDto> findBookmarkNic(String loginuserNic);

	// 즐겨찾기 해제
	@Delete("DELETE FROM messageBookmark " +
			"WHERE userNic = #{ loginuserNic } AND bookmarkNic = #{ bookmarkNic } ")
	void removeBookmark(@Param("loginuserNic") String loginuserNic, @Param("bookmarkNic") String bookmarkNic);
	
}
