package com.project_catmoa.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project_catmoa.dto.BoardAttachDto;
import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingBoardDto;
import com.project_catmoa.dto.ReportAttachDto;
import com.project_catmoa.dto.ReportBoardDto;

@Mapper
public interface BoardMapper {
	
	@Insert("INSERT INTO boardCommon(boardTitle, boardGroupNo, userId, boardContent) " +
			"VALUES (#{ boardTitle }, #{ boardGroupNo }, #{ userId }, #{ boardContent })")
	@Options(useGeneratedKeys = true, keyColumn = "boardNo", keyProperty = "boardNo")
	void insertBoard(BoardDto board);
	
	// 제보게시판 정보받기
	@Insert("INSERT INTO reportBoard(boardNo, characteristic,catNickname ,tnrYn, colorCode, localNo, catGender, catMonth, catDay, catHour ) " +
			"VALUES (#{ boardNo }, #{ characteristic }, #{ catNickname }, #{ tnrYn }, #{ colorCode }, #{ localNo }, #{ catGender }, #{ catMonth }, #{ catDay }, #{ catHour } )")
	void insertReportBoard(ReportBoardDto reportboard);
	
	// 급식게시판 정보받기
	@Insert("INSERT INTO feedingBoard(boardNo, feedingContent, localNo, catsId )" +
			"VALUES (#{ boardNo }, #{ feedingContent }, #{ localNo }, #{ catsId } )")
	void insertFeedingBoard(FeedingBoardDto board);
		
	@Select("SELECT DISTINCT city FROM feedingArea ")
	List<String> searchSido();
	
	@Select("SELECT colorCode, colorName FROM catColor ")
	List<CatColorDto> searchColor();
	
	@Select("SELECT * FROM boardCommon WHERE boardgroupno = 1 and boardDeleted = 0 ORDER BY boardNo DESC LIMIT #{ from }, #{ count }")
	List<BoardDto> selectBoardsByPage(@Param("from") int from, @Param("count") int count);
	
	@Select("SELECT * FROM boardCommon WHERE boardgroupno = 2 and  boardDeleted = 0 ORDER BY boardNo DESC LIMIT #{ from }, #{ count }")
	List<BoardDto> selectRescueBoardsByPage(@Param("from") int from, @Param("count") int count);
	
	// 급식게시판
	@Select("SELECT * FROM boardCommon " +
			"WHERE boardDeleted = 0 ")
	List<BoardDto> findAllBoardCommon();
	
	@Select("SELECT * FROM feedingBoard " +
			"WHERE localNo = #{ localNo } ")
	List<FeedingBoardDto> findFeedingBoard(int localNo);
	
	@Select("SELECT count(*) FROM boardCommon WHERE  boardgroupno = 1 and boardDeleted = 0 ")
	int boardCount();
	
	@Select("SELECT count(*) FROM boardCommon WHERE  boardgroupno = 1 and boardDeleted = 0 ")
	int rescueBoardCount();
	
	@Select("SELECT * FROM boardCommon WHERE boardNo = #{ boardNo } ")
	@Results(id = "boardResultMap",
	 value = {
			 @Result(column = "boardNo", property = "boardNo", id = true),
			 @Result(column = "boardGroupNo", property = "boardGroupNo"),
			 @Result(column = "writeTime", property = "writeTime"),
			 @Result(column = "readCount", property = "readCount"),
			 @Result(column = "report", property = "report"),
			 @Result(column = "userId", property = "userId"),
			 @Result(column = "boardTitle", property = "boardTitle"),
			 @Result(column = "boardContent", property = "boardContent"),
			 @Result(column = "boardDeleted", property = "boardDeleted"),
			 @Result(column = "boardNo", property = "boardAttachments", 
			 		 many = @Many(select = "selectAttachByBoardNo")),
			 @Result(column = "boardNo", property = "comments", 
			 		 many = @Many(select = "com.project_catmoa.mapper.BoardCommentMapper.selectCommentByBoardNo"))
	 })
	
	/*
	 * @Results(id = "boardResultMap", value = {
	 * 
	 * @Result(column = "boardNo", property = "boardAttachments", many
	 * = @Many(select = "selectAttachByBoardNo")) })
	 */
	BoardDto selectBoardByBoardNo(int boradNo);

	@Select("SELECT * FROM boardCommon WHERE boardGroupNo = #{ boardGroupNo }")
	BoardDto selectBoardBybgNo(int boardGroupNo);
	
	@Update("UPDATE boardCommon SET boardDeleted = 1 WHERE boardNo = #{ boardNo }")
	void deleteBoard(int boardNo);

	@Select("SELECT COUNT(*) FROM reply " +
			"WHERE boardNo = #{ boardNo } ")
	int countReply(int boardNo);

	@Update("UPDATE boardCommon SET boardTitle = #{ boardTitle }, boardContent = #{ boardContent } WHERE boardNo = #{ boardNo }")
	void updateBoard(BoardDto board);
	
	@Insert("INSERT INTO boardAttachment (boardNo, userFileName, savedFileName) " +  "VALUES (#{ boardNo }, #{ userFileName }, #{ savedFileName }) ")
	void insertBoardAttach(BoardAttachDto boardAttach);
	
	@Select("SELECT DISTINCT gu FROM feedingArea WHERE city=#{sido} ")
	List<String> selectGugunBySido(String sido);

	@Select("SELECT DISTINCT localNo, area FROM feedingArea WHERE gu = #{gu} ")
	List<HashMap<String, Object>> selectAreaByGu(String gu);
	
	@Select("SELECT boardNo, attachmentNo, userFileName, savedFileName " +
			"FROM boardAttachment " +
			"WHERE boardNo = #{ boardNo } ")
	List<BoardAttachDto> selectAttachByBoardNo(int boardNo);
	
	@Select("SELECT boardNo, reportFileNo, userFileName, savedFileName " +
			"FROM reportAttachment " +
			"WHERE boardNo = #{ boardNo } ")
	List<ReportAttachDto> selectReportAttachByBoardNo(int boardNo);
	
	@Select("SELECT boardNo, attachmentNo, userFileName, savedFileName " +
			"FROM boardAttachment " +
			"WHERE attachmentNo = #{ attachmentNo } ")
	BoardAttachDto selectAttachByAttachmentNo(int attachmentNo);

	@Insert("INSERT INTO reportAttachment (boardNo, userFileName, savedFileName) " +
			"VALUES (#{ boardNo }, #{ userFileName }, #{ savedFileName }) ")
	void insertReportAttach(ReportAttachDto reportAttachment);

	@Select("SELECT * FROM reportBoard WHERE boardNo = #{ boardNo } ")
	@Results(id = "reportResultMap",
	 value = {
			 @Result(column = "boardNo", property = "boardNo", id = true),
			 @Result(column = "boardGroupNo", property = "boardGroupNo"),
			 @Result(column = "boardNo", property = "reportAttachments", 
			 		 many = @Many(select = "selectReportAttachByBoardNo"))
	 })
	ReportBoardDto selectReportByBoardNo(int boardNo);

	// 제보
	@Select("SELECT bc.boardNo, bc.userId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, " +
			"       bc.boardContent, cc.colorName, rb.tnrYn, rb.catGender, rb.characteristic, rb.catNickname, " +
			"		concat(rb.catMonth, '월 ', rb.catDay, '일 ', rb.catHour, '시경') catTime, ra.savedFileName " +
			"FROM boardCommon bc " +
			"INNER JOIN reportBoard rb " +
			"ON bc.boardNo = rb.boardNo " +
			"INNER JOIN feedingArea fa " +
			"ON rb.localNo = fa.localNo " +
			"INNER JOIN catColor cc " +
			"ON rb.colorCode = cc.colorCode " +
			"INNER JOIN reportAttachment ra " +
            "ON rb.boardNo = ra.boardNo " +
			"WHERE bc.boardNo = #{ boardNo }")
	HashMap<String, Object> selectReportDetailByBoardNo(int boardNo);

	// 급식
	@Select("SELECT bc.boardNo, bc.userId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, " +
			"       fb.feedingContent, ba.savedFileName " +
			"FROM boardCommon bc " +
			"INNER JOIN feedingBoard fb " +
			"ON bc.boardNo = fb.boardNo " +
			"INNER JOIN feedingArea fa " +
			"ON fb.localNo = fa.localNo " +
			"INNER JOIN boardAttachment ba " +
            "ON fb.boardNo = ba.boardNo " +
			"WHERE bc.boardNo = #{ boardNo }")
	HashMap<String, Object> selectFeedingDetailByBoardNo(int boardNo);

	

	

	

	

	
	
}
