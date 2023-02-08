/* eslint-disable react/prop-types */
import React, { useEffect, useState } from "react";
import axios from "axios";
import TrafficList from "./TrafficList";

function TrafficStts({ data }) {
  return (
    <section className="container">
      <div className="trafficInfo">
        {data.map((d) => (
          <TrafficList
            ROAD_MSG={d.ROAD_MSG}
            ROAD_TRAFFIC_IDX={d.ROAD_TRAFFIC_IDX}
            ROAD_TRFFIC_TIME={d.ROAD_TRFFIC_TIME}
            ROAD_NM={d.ROAD_NM}
            START_ND_NM={d.START_ND_NM}
            END_ND_NM={d.END_ND_NM}
            SPD={d.SPD}
            IDX={d.IDX}
          />
        ))}
      </div>
    </section>
  );
}

export default TrafficStts;
