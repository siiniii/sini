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
import com.project_catmoa.dto.ReportAttachDto;
import com.project_catmoa.dto.ReportBoardDto;
import com.project_catmoa.mapper.BoardCommentMapper;
import com.project_catmoa.mapper.BoardMapper;

import lombok.Setter;

public class BoardServiceImpl implements BoardService{

	@Setter
	private BoardMapper boardMapper;
	
	@Setter
	private BoardCommentMapper boardCommentMapper;

	@Override
	public void writeBoard(BoardDto board) {
		
		boardMapper.insertBoard(board);	
		
		if (board.getBoardAttachments() != null) {
			for (BoardAttachDto attachment : board.getBoardAttachments()) {
				attachment.setBoardNo(board.getBoardNo()); // 새로 만들어진 글번호를 Attach 객체에 저장
				boardMapper.insertBoardAttach(attachment);
			}
		}
	}
	
	@Override
	public void writeReportBoard(ReportBoardDto reportboard) {
		boardMapper.insertBoard(reportboard);	
		boardMapper.insertReportBoard(reportboard);	
		
		if (reportboard.getReportAttachments() != null) {
			for (ReportAttachDto attachment : reportboard.getReportAttachments()) {
				attachment.setBoardNo(reportboard.getBoardNo()); // 새로 만들어진 글번호를 Attach 객체에 저장
				boardMapper.insertReportAttach(attachment);
			}
		}
	}
	
	@Override
	public void writeFeedingBoard(FeedingBoardDto board) {
		
		boardMapper.insertBoard(board);
		boardMapper.insertFeedingBoard(board);
		
		if (board.getBoardAttachments() != null) {
			for (BoardAttachDto attachment : board.getBoardAttachments()) {
				attachment.setBoardNo(board.getBoardNo()); // 새로 만들어진 글번호를 Attach 객체에 저장
				boardMapper.insertBoardAttach(attachment);
			}
		}
		
	}
	
	@Override
	public List<String> searchSido() {
		
		List<String> feedingArea = boardMapper.searchSido();
		
		return feedingArea;
	}
	
	@Override
	public List<CatColorDto> searchColor() {
		
		List<CatColorDto> color = boardMapper.searchColor();
		
		return color;
	}

	@Override
	public List<BoardDto> findBoardByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		List<BoardDto> boards = boardMapper.selectBoardsByPage(from, count);
		
		return boards;
	}
	
	@Override
	public List<BoardDto> findRescueBoardByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		List<BoardDto> boards = boardMapper.selectRescueBoardsByPage(from, count);
		
		return boards;
	}
	
	
	@Override
	public List<BoardDto> findAllBoard() {
		
		
		List<BoardDto> boards = boardMapper.findAllBoardCommon();
		
		return boards;
	}
	
	@Override
	public List<FeedingBoardDto> findFeedingBoard(int localNo) {
		
		
		List<FeedingBoardDto> boards = boardMapper.findFeedingBoard(localNo);
		
		return boards;
	}

	@Override
	public int findBoardCount() {

		int boardCount = boardMapper.boardCount();
		return boardCount;
	}	
	@Override
	public int findRescueBoardCount() {

		int boardCount = boardMapper.rescueBoardCount(); 
		return boardCount;
	}

	@Override
	public BoardDto findBoardByBoardNo(int boardNo) {

		BoardDto board = boardMapper.selectBoardByBoardNo(boardNo);
		return board;
	}

	@Override
	public BoardDto findBoardBybgNo(int boardGroupNo) {
		
		BoardDto board = boardMapper.selectBoardBybgNo(boardGroupNo);
		return board;
	}
	
	@Override
	public void deleteBoard(int boardNo) {
		boardMapper.deleteBoard(boardNo);
	}
	
	// 구조게시판 지역선택
	
	@Override
	public List<String> findGugunBySido(String sido) {
		List<String> gu = boardMapper.selectGugunBySido(sido);
		return gu;
	}
	
	@Override
	public List<HashMap<String, Object>> findAreaByGu(String gu) {
		List<HashMap<String, Object>> area = boardMapper.selectAreaByGu(gu);
		return area;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<BoardCommentDto> findBoardCommentByBoardNo(int boardNo) {
		
		List<BoardCommentDto> comments = boardCommentMapper.selectCommentByBoardNo(boardNo);
		
		return comments;
		
	}

	@Override
	public void writeComment(BoardCommentDto comment) {
		boardCommentMapper.insertComment(comment);
	}

	@Override
	public void updateGroupNo(int commentNo, int groupNo) {

		boardCommentMapper.updateGroupNo(commentNo, groupNo);
	}

	@Override
	public void deleteComment(int commentNo) {
		boardCommentMapper.deleteComment(commentNo);
	}

	@Override
	public void updateComment(BoardCommentDto comment) {
		boardCommentMapper.updateComment(comment);
	}

	@Override
	public void writeReComment(BoardCommentDto commentDto) {
		
		BoardCommentDto parent = boardCommentMapper.selectCommentByCommentNo(commentDto.getCommentNo());
		commentDto.setBoardNo(parent.getBoardNo());
		commentDto.setGroupno(parent.getGroupno());
		commentDto.setStep(parent.getStep() + 1);
		commentDto.setDepth(parent.getDepth() + 1);
		
		boardCommentMapper.updateStepNo(parent.getGroupno(), parent.getStep());
		
		boardCommentMapper.insertReComment(commentDto);
	}

	@Override
	public int countReply(int boardNo) {
		
		int replyCount = boardMapper.countReply(boardNo);
		return replyCount;
	}

	@Override
	public BoardCommentDto selectComment(int commentNo) {
		BoardCommentDto comment = boardCommentMapper.selectCommentByCommentNo(commentNo);
		return comment;
	}

	@Override
	public void modifyBoard(BoardDto board) {
		boardMapper.updateBoard(board);

	}

	

	@Override
	public BoardAttachDto selectAttachByAttachmentNo(int attachmentNo) {
		
		BoardAttachDto attachment = boardMapper.selectAttachByAttachmentNo(attachmentNo);
		
		return attachment;
	}

	@Override
	public ReportBoardDto findReportByBoardNo(int boardNo) {
		
		ReportBoardDto board = boardMapper.selectReportByBoardNo(boardNo);
		
		return board;
	}

	@Override
	public HashMap<String, Object>  findReportDetailByBoardNo(int boardNo) {
		HashMap<String, Object> reportDto = boardMapper.selectReportDetailByBoardNo(boardNo);
		return reportDto;
	}

	@Override
	public HashMap<String, Object> findFeedingDetailByBoardNo(int boardNo) {
		HashMap<String, Object> feedingDto = boardMapper.selectFeedingDetailByBoardNo(boardNo);
		return feedingDto;
	}








	
}
