/* eslint-disable react/prop-types */
import axios from "axios";
import VerticalBarChart from "layouts/Charts/BarCharts/VerticalBarChart";
import { useEffect } from "react";

// const sdk = require('api')('@skopenapi/v1.0#3m42ll57zc91a');

function CongestDashboard({ congestions }) {
  return (
    <VerticalBarChart
      // icon={{ color: "info", component: "leaderboard" }}
      title="실시간 혼잡도 추이전망"
      description="Sales related to age average"
      chart={{
        labels: congestions.map((congestion, idx) => `${congestion.datetime.substring(8, 10)}시`),
        datasets: [
          {
            label: `혼잡도 / 인구수`,
            color: "dark",
            data: congestions.map((congestion, idx) => congestion.congestion),
          },
        ],
      }}
    />
  );
}
export default CongestDashboard;
