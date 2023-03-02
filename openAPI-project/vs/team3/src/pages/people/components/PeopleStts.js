/* eslint-disable react/prop-types */
import React, { useEffect, useState } from "react";
import axios from "axios";
import Dashboard1 from "./CongestDashboard";

function PeopleStts(props) {
  const [data, setData] = useState([]);

  return (
    <section className="container">
      <div className="trafficInfo">
        {data.map((d) => (
          <Dashboard1
            AREA_PPLTN_MIN={d.AREA_PPLTN_MIN}
            AREA_PPLTN_MAX={d.AREA_PPLTN_MAX}
            MALE_PPLTN_RATE={d.MALE_PPLTN_RATE}
            FEMALE_PPLTN_RATE={d.FEMALE_PPLTN_RATE}
            PPLTN_RATE_0={d.PPLTN_RATE_0}
            PPLTN_RATE_10={d.PPLTN_RATE_10}
            PPLTN_RATE_20={d.PPLTN_RATE_20}
            PPLTN_RATE_30={d.PPLTN_RATE_30}
            PPLTN_RATE_40={d.PPLTN_RATE_40}
            PPLTN_RATE_50={d.PPLTN_RATE_50}
            PPLTN_RATE_60={d.PPLTN_RATE_60}
            PPLTN_RATE_70={d.PPLTN_RATE_70}
            RESNT_PPLTN_RATE={d.RESNT_PPLTN_RATE}
            NON_RESNT_PPLTN_RATE={d.NON_RESNT_PPLTN_RATE}
          />
        ))}
      </div>
    </section>
  );
}

export default PeopleStts;
