package com.project_catmoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;

import com.project_catmoa.dto.IntroDto;
import com.project_catmoa.dto.MessageAttachDto;
import com.project_catmoa.dto.MessageBookmarkDto;
import com.project_catmoa.dto.MessageDto;

@Mapper
public interface MessageMapper {

	// 받은 쪽지 목록
	@Select("SELECT msgNo, msgTitle, msgContent, sendDate, recvChk, sendNic, recvNic "	+
			"FROM message " +
			"WHERE recvNic = #{ loginuser } " +
			"ORDER BY msgNo DESC LIMIT #{ from }, #{ count } ")
	List<MessageDto> findRecvMessageByPage(@Param("from") int from, @Param("count") int count, @Param("loginuser") String loginuserNic);

	// 받은 쪽지 목록 페이지 설정
	@Select("SELECT COUNT(*) FROM message WHERE recvNic = #{ loginuserNic } ")
	int selectRecvMessageCount(String loginuserNic);

	// 보낸 쪽지 목록
	@Select("SELECT msgNo, msgTitle, msgContent, sendDate, recvChk, sendNic, recvNic " +
			"FROM message " +
			"WHERE sendNic = (#{ loginuser }) " +
			"ORDER BY msgNo DESC " + "LIMIT #{ from }, #{ count } ")
	List<MessageDto> findSendedMessageByPage(@Param("from") int from, @Param("count") int count, @Param("loginuser") String loginuserNic);

	// 보낸 쪽지 목록 페이지 설정
	@Select("SELECT COUNT(*) FROM message WHERE sendNic = #{ loginuserNic } ")
	int selectSendedMessageCount(String loginuserNic);

	// 쪽지 디테일
	@Select("SELECT msgNo, msgTitle, msgContent, sendDate, recvChk, sendNic, recvNic "
			+ "FROM message " +
			"WHERE msgNo = #{ msgNo } ")
	@Results(id = "messageResultMap",
	 value = {
			 @Result(column = "msgNo", property = "attachments",
			 		 many = @Many(select = "selectMessageAttachByMsgNo"))
	 })
	MessageDto findMessageDetailByMsgNo(int msgNo);

	// 쪽지 보낼 때 사용자 ID가 존재하는지 확인하는 작업
	@Select("SELECT * FROM user " + "WHERE nic = #{ recvNic } ")
	IntroDto searchRecvNic(MessageDto message);

	// 쪽지 보내기
	@Insert("INSERT INTO message(msgTitle, msgContent, sendDate, recvChk, sendNic, recvNic) "
			+ "VALUES (#{ msgTitle }, #{ msgContent }, NOW(), #{ recvChk }, #{ sendNic }, #{ recvNic }) ")
	@Options(useGeneratedKeys = true, keyColumn = "msgNo", keyProperty = "msgNo")
	void sendMessage(MessageDto message);

	// 첨부파일 넣기
	@Insert("INSERT INTO messageFile (msgNo, userFileName, savedFileName) " +
			"VALUES (#{ msgNo }, #{ userFileName }, #{ savedFileName }) ")
	void insertmessageAttach(MessageAttachDto attachment);
	
	// 쪽지 번호로 첨부파일 찾기
	@Select("SELECT msgNo, msgFileNo, userFileName, savedFileName " +
			"FROM messageFile " +
			"WHERE msgNo = #{ msgNo } ")
	List<MessageAttachDto> selectMessageAttachByMsgNo(int msgNo);
	
	// 파일 번호로 첨부파일 찾기
	@Select("SELECT msgNo, msgFileNo, userFileName, savedFileName " +
			"FROM messageFile " +
			"WHERE msgFileNo = #{ msgFileNo } ")
	MessageAttachDto selectMessageAttachByMsgFileNo(int msgFileNo);

	// 읽음 체크 표시
	@Update("UPDATE message " +
			"SET recvChk = 1 " +
			"WHERE msgNo = #{ msgNo } ")
	void increaseRecvChk(int msgNo);

	// 즐겨찾기 친구 불러오기
	@Select("SELECT userNic, bookmarkNic " +
			"FROM messageBookmark " +
			"WHERE userNic = #{ loginuserNic } " +
			"ORDER BY bookmarkNic DESC ")
	List<MessageBookmarkDto> findBookmarkNic(String loginuserNic);

	// 즐겨찾기 등록
	@Insert("INSERT INTO messageBookmark (userNic, bookmarkNic) " +
			"VALUES (#{ loginuserNic }, #{ bookmarkNic }) ")
	void addBookmark(@Param("loginuserNic") String loginuserNic, @Param("bookmarkNic") String bookmarkNic);

	// 즐겨찾기 해제
	@Delete("DELETE FROM messageBookmark " +
			"WHERE userNic = #{ loginuserNic } AND bookmarkNic = #{ bookmarkNic } ")
	void removeBookmark(@Param("loginuserNic") String loginuserNic, @Param("bookmarkNic") String bookmarkNic);

}
