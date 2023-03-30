package com.project_catmoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project_catmoa.dto.BoardCommentDto;

@Mapper
public interface BoardCommentMapper {

	@Insert("INSERT INTO reply(boardNo, userId, content, groupno, step, depth) " +
			"VALUES(#{ boardNo }, #{ userId }, #{ content }, -1, 1, 0)")
	@Options(useGeneratedKeys = true, keyColumn = "boardNo", keyProperty = "boardNo")
	void insertComment(BoardCommentDto comment);
	
	@Update("UPDATE reply SET groupno = #{ groupno } WHERE commentNo = #{ commentNo }")
	void updateGroupNo(@Param("commentNo")int commentNo, @Param("groupno")int groupno);
	
	@Select("SELECT commentNo, userId, content, regDate, deleted, groupno, step, depth " +
			"FROM reply WHERE boardNo = #{ boardNo } AND deleted = 0 ORDER BY groupno DESC, step ASC")
	List<BoardCommentDto> selectCommentByBoardNo(int boardNo);
	
	@Update("UPDATE reply SET deleted = 1 WHERE commentNo = #{ commentNo }")
	void deleteComment(int commentNo);
	
	@Update("UPDATE reply SET content = #{ content } WHERE commentNo = #{ commentNo }")
	void updateComment(BoardCommentDto comment);
	
	@Select("SELECT commentNo, boardNo, userId, content, regdate, groupno, step, depth " +
					"FROM reply WHERE commentNo = #{ commentNo }")
	BoardCommentDto selectCommentByCommentNo(int commentNo);
	
	@Update("UPDATE reply SET step = step + 1 WHERE groupno = #{ groupno } and step > #{ step }")
	void updateStepNo(@Param("groupno") int groupno, @Param("step") int step);
	
	@Insert("INSERT INTO reply (boardNo, userId, content, groupno, step, depth) " +
					"VALUES (#{ boardNo }, #{ userid }, #{ content }, #{ groupno }, #{ step }, #{ depth }")
	void insertReComment(BoardCommentDto commentDto);
	
}
