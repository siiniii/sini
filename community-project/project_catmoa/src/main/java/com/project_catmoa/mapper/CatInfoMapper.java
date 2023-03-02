package com.project_catmoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.project_catmoa.dto.CatInfoDto;
import com.project_catmoa.dto.FeedingAreaDto;
import com.project_catmoa.dto.LocalDto;

@Mapper
public interface CatInfoMapper {
	/*
	 * @Select("SELECT catNickname, colorCode, tcrYn, characteristic, catImage "
	 * + "FROM catInfo ") List<CatInfoDto> selectCatInfoByCatId();
	 */

	@Select("SELECT catsId, catNickname, colorCode, tnrYn, characteristic, catImage " +
			"FROM catInfo " +
			"LIMIT #{ from },#{ count }")
	List<CatInfoDto> selectCatinfoByPage(@Param("from")int from, @Param("count")int count);

	@Select("SELECT COUNT(*) FROM catInfo ")
	int selectBoardCount();

	@Select("SELECT catsId, catNickname, colorCode, tnrYn, characteristic, catImage " +
			"FROM catInfo " +
			"WHERE localNo = #{localNo} ")
	List<CatInfoDto> selectCatinfoByLocalNo(int localNo);

	@Select("SELECT localNo, city, gu, area, lat, lng " +
			"FROM feedingArea")
	List<FeedingAreaDto> selectAllFeedingAreas();

	@Select("SELECT localId, gugun, dong, dongLat, dongLng " +
			"FROM local ")
	List<LocalDto> selectAllLocals();

	@Select("SELECT DISTINCT sido FROM local")
	List<String> selectAllSido();

	@Select("SELECT DISTINCT gugun FROM local WHERE sido = #{sido}")
	List<String> selectGugunBySido(String sido);

	@Select("SELECT DISTINCT dong, dongLat, dongLng FROM local WHERE gugun = #{gugun}")
	List<LocalDto> selectDongByGugun(String gugun);
	
	

}
