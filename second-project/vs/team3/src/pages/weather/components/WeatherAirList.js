/* eslint-disable prettier/prettier */
/* eslint-disable react/prop-types */
import TimelineItem from "layouts/Timeline/TimelineItem";
import TimelineList from "layouts/Timeline/TimelineList";
import React from "react";

// 대기 정보
function WeatherAirList({ airData }) {
  return (
    <div className="weatherList">
    <div>
      <TimelineList>
        <div>
          <h3>대기/환경</h3>
          <h5>{airData.WEATHER_TIME}</h5>
        </div>
        <br />
        <TimelineItem
          py={30}
          color="success"
          icon="notifications"
          title="자외선 지수"
          description={airData.UV_INDEX}
          badges={["design"]}
        />
         <TimelineItem
          py={30}
          color="success"
          icon="notifications"
          title="자외선 지수 단계"
          description={airData.UV_INDEX_LVL}
          badges={["design"]}
        />
         <TimelineItem
          py={30}
          color="primary"
          icon="inventory_2"
          title="자외선 알림"
          description={airData.UV_MSG}
          badges={["order", "#1832412"]}
        />
      </TimelineList>
    </div>
    </div>
  );
}
export default WeatherAirList;