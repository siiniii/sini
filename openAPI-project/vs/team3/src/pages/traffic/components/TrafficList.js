/* eslint-disable prettier/prettier */
/* eslint-disable react/prop-types */
import React, { useEffect, useState } from "react";

function TrafficList({ datas }) {

  const style = {
    lineHeight: "10px"
  }
  // const [list, setList] = useState([{ roadMsg: "", trafficIdx: "", trafficTime:"" }]);

  // useEffect(() => {
  //   if (datas.length !== 0 ) {
  //     const newLists = [];
  //     datas.map((data) =>
  //       newLists.push({
  //         roadMsg: data.ROAD_MSG,
  //         trafficIdx: data.ROAD_TRAFFIC_IDX,
  //         trafficTime: data.ROAD_TRFFIC_TIME,
  //       })
  //     );
  //     setList(newLists);
  //     }
  // },[datas]);
  return (
    <div className="trafficList">
      <h5 style={style}>실시간 도로별 교통 현황</h5><br />
      <div className="roadMsg"><h6>도로교통메세지: {datas.ROAD_MSG}</h6></div>
      <div className="roadTrafficIdx"><h6>도로교통현황: {datas.ROAD_TRAFFIC_IDX}</h6></div>
      <div className="roadTrafficTime"><h6>교통기준시간: {datas.ROAD_TRFFIC_TIME} </h6></div>
    </div>
  );
}
export default TrafficList;
