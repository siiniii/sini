/* eslint-disable no-param-reassign */
/* eslint-disable react/prop-types */
import DefaultDoughnutChart from "layouts/Charts/DoughnutCharts/DefaultDoughnutChart";

function AgeRateDashboard({ data }) {
  if (data.length === 0) {
    data.PPLTN_RATE_0 = 100;
  }

  return (
    <div>
      <DefaultDoughnutChart
        // icon={{ color: "info", component: "leaderboard" }}
        title="연령대별 비율"
        description="Affiliates program"
        chart={{
          labels: ["0~10세", "10대", "20대", "30대", "40대", "50대", "60대", "70대"],
          datasets: {
            label: "Projects",
            backgroundColors: [
              "primary",
              "secondary",
              "info",
              "success",
              "warning",
              "error",
              "light",
              "dark",
            ],
            data: [
              data.PPLTN_RATE_0,
              data.PPLTN_RATE_10,
              data.PPLTN_RATE_20,
              data.PPLTN_RATE_30,
              data.PPLTN_RATE_40,
              data.PPLTN_RATE_50,
              data.PPLTN_RATE_60,
              data.PPLTN_RATE_70,
            ],
          },
        }}
      />
    </div>
  );
}

export default AgeRateDashboard;
