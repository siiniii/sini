package com.project_catmoa.service;

import java.util.HashMap;
import java.util.List;

import com.project_catmoa.dto.BoardAttachDto;
import com.project_catmoa.dto.BoardCommentDto;
import com.project_catmoa.dto.BoardDto;
import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.FeedingBoardDto;
import com.project_catmoa.dto.LocalDto;
import com.project_catmoa.dto.ReportBoardDto;


public interface BoardService {

	void writeBoard(BoardDto board);
	void writeReportBoard(ReportBoardDto reportboard);
	void writeFeedingBoard(FeedingBoardDto board);
	
	List<String> searchSido();
	List<CatColorDto> searchColor();
	
	List<BoardDto> findBoardByPage(int pageNo, int pageSize);
	List<BoardDto> findRescueBoardByPage(int pageNo, int pageSize);
	
	
	List<FeedingBoardDto> findFeedingBoard(int localNo);
	List<BoardDto> findAllBoard();
	
	int findBoardCount();
	int findRescueBoardCount();
	
	BoardDto findBoardByBoardNo(int boardNo);

	BoardDto findBoardBybgNo(int boardGroupNo);
	
	void deleteBoard(int boardNo);
	
	void modifyBoard(BoardDto board);
	
	
	// 첨부파일
	/* void */
	
////////////////////////////////////////////////////////////////////////////////////
	
	void writeComment(BoardCommentDto comment);
	
	void updateGroupNo(int commentNo, int groupNo);

	void deleteComment(int commentNo);

	List<BoardCommentDto> findBoardCommentByBoardNo(int boardNo);

	void updateComment(BoardCommentDto comment);

	void writeReComment(BoardCommentDto commentDto);

	int countReply(int boardNo);
	
	BoardCommentDto selectComment(int commentNo);
	
	List<String> findGugunBySido(String sido);
	
	List<HashMap<String, Object>> findAreaByGu(String gu);
	
	BoardAttachDto selectAttachByAttachmentNo(int attachmentNo);
	
	ReportBoardDto findReportByBoardNo(int boardNo);
	
	// 제보
	HashMap<String, Object>  findReportDetailByBoardNo(int boardNo);
	
	// 급식
	HashMap<String, Object> findFeedingDetailByBoardNo(int boardNo);
	
	
	
	
	
	



}