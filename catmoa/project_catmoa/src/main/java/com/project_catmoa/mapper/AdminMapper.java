package com.project_catmoa.mapper;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project_catmoa.dto.CatColorDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.IntroDto;

@Mapper
public interface AdminMapper {

	@Select("SELECT name, userId, nic, sex, age, admin " +
			"FROM user " +
			"ORDER BY name LIMIT #{ from }, #{ count } ")
	List<IntroDto> findUserList(@Param("from") int from, @Param("count") int count);

	@Select("SELECT COUNT(*) FROM user ")
	int selectUserListCount();
	
	@Update("UPDATE user " +
			"SET admin = 1 " +
			"WHERE userId = #{ userId } ")
	void addAdmin(String userId);

	@Update("UPDATE user " +
			"SET admin = 2 " +
			"WHERE userId = #{ userId } ")
	void removeAdmin(String userId);
	
	@Select("SELECT bc.boardNo, bc.userId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, " +
			"       bc.boardContent, cc.colorName, bc.writeTime " +
			"FROM boardCommon bc " +
			"INNER JOIN reportBoard rb " +
			"ON bc.boardNo = rb.boardNo " +
			"INNER JOIN feedingArea fa " +
			"ON rb.localNo = fa.localNo " +
			"INNER JOIN catColor cc " +
			"ON rb.colorCode = cc.colorCode " +
			"ORDER BY boardNo DESC LIMIT #{ from }, #{ count } ")
	List<HashMap<String, Object>> selectReportList(@Param("from") int from, @Param("count") int count);
	
	@Select("SELECT COUNT(*) " +
			"FROM boardCommon bc " +
			"INNER JOIN reportBoard rb " +
			"ON bc.boardNo = rb.boardNo " +
			"INNER JOIN feedingArea fa " +
			"ON rb.localNo = fa.localNo " +
			"INNER JOIN catColor cc " +
			"ON rb.colorCode = cc.colorCode ")
	int selectReportListCount();

	@Select("SELECT bc.boardNo, bc.userId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, " +
			"       bc.boardContent, cc.colorCode, cc.colorName, rb.tnrYn, rb.catGender, rb.characteristic, rb.catNickname, ra.savedFileName " +
			"FROM boardCommon bc " +
			"INNER JOIN reportBoard rb " +
			"ON bc.boardNo = rb.boardNo " +
			"INNER JOIN feedingArea fa " +
			"ON rb.localNo = fa.localNo " +
			"INNER JOIN catColor cc " +
			"ON rb.colorCode = cc.colorCode " +
			"INNER JOIN reportAttachment ra " +
			"ON bc.boardNo = ra.boardNo " +
			"WHERE bc.boardNo = #{ boardNo }")
	HashMap<String, Object> selectReportDetailByBoardNo(int boardNo);


	@Select("SELECT c.catsId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, c.characteristic, " +
			"		c.catNickname, c.catGender, c.tnrYn, cc.colorName, DATE_FORMAT(c.registerTime, '%Y-%m-%d') registerTime, c.catImage " +
			"FROM catInfo c " +
			"INNER JOIN feedingArea fa " +
			"ON c.localNo = fa.localNo " +          	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
			"INNER JOIN catColor cc " +
			"ON c.colorCode = cc.colorCode " + 
			"WHERE c.catsId = #{ catsId } ")
	HashMap<String, Object> selectCatinfoDetailByCatsId(String catsId);

	@Select("SELECT DISTINCT * FROM catColor ")
	List<CatColorDto> selectCatColor();

	@Select("SELECT c.catsId, concat(fa.city, ' ', fa.gu, ' ', fa.area) localName, " +
			"		c.catNickname, c.catGender, cc.colorName, c.registerTime " +
			"FROM catInfo c " +
			"INNER JOIN feedingArea fa " +
			"ON c.localNo = fa.localNo " +                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
			"INNER JOIN catColor cc " +
			"ON c.colorCode = cc.colorCode " +
			"WHERE fa.city = #{city} AND fa.gu = #{ gu } AND c.colorCode = #{ colorCode } " +
			"ORDER BY catsId DESC " + 
			"LIMIT #{ from },#{ count }")
	List<HashMap<String, Object>> selectCatInfoListByPage(@Param("city")String sido, @Param("gu")String gu, @Param("colorCode")int colorCode, @Param("from")int from, @Param("count")int count);
	
	@Select("SELECT COUNT(*) " +
			"FROM catInfo c " +
			"INNER JOIN feedingArea fa " +
			"ON c.localNo = fa.localNo " +                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
			"INNER JOIN catColor cc " +
			"ON c.colorCode = cc.colorCode " +
			"WHERE fa.city = #{city} AND fa.gu = #{ gu } AND c.colorCode = #{ colorCode } ")
	int selectCatInfoListCount(@Param("city")String sido, @Param("gu")String gu, @Param("colorCode")int colorCode);

	@Insert("INSERT INTO catInfo (characteristic, tnrYn, catNickname, colorCode, catGender, localNo, catImage) "
			+ "SELECT rb.characteristic, rb.tnrYn, rb.catNickname, rb.colorCode, rb.catGender, rb.localNo, ra.savedFileName from reportBoard rb "
			+ "LEFT OUTER JOIN reportAttachment ra "
			+ "ON rb.boardno = ra.boardno "
			+ "WHERE rb.boardNo = #{ boardNo }")
	void insertCatinfoByBoardNo(int boardNo);
		
	/////////////////////////////////////////////////////////////////////////////
	@Select("SELECT city, gu, area, lat, lng " +
			"FROM feedingArea " +
			"WHERE city = #{ city } AND gu = #{ gu } AND area = #{ area } AND lat LIKE #{ lat } AND lng LIKE #{ lng } ")
	FeedingAreaDto searchRegion(FeedingAreaDto region);

	@Select("SELECT city, gu, area " +
			"FROM feedingArea " +
			"WHERE city = #{ city } AND gu = #{ gu } AND area = #{ area } ")
	FeedingAreaDto searchRegion2(@Valid FeedingAreaDto region);
	
	@Update("INSERT INTO feedingArea(city, gu, area, lat, lng) " +
			"VALUES (#{ city }, #{ gu }, #{ area }, #{ lat }, #{ lng }) ")
	void addRegion(FeedingAreaDto region);

}
