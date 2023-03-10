/* eslint-disable no-param-reassign */
/* eslint-disable react/prop-types */
import DefaultDoughnutChart from "layouts/Charts/DoughnutCharts/DefaultDoughnutChart";

function ResntRateDashboard({ data }) {
  if (data.length === 0) {
    data.RESNT_PPLTN_RATE = 50;
    data.NON_RESNT_PPLTN_RATE = 50;
  }

  return (
    <div>
      <DefaultDoughnutChart
        // icon={{ color: "info", component: "leaderboard" }}
        title="상주·비상주 비율"
        description="Affiliates program"
        chart={{
          labels: ["상주", "비상주"],
          datasets: {
            label: "Projects",
            backgroundColors: ["info", "dark"],
            data: [data.RESNT_PPLTN_RATE, data.NON_RESNT_PPLTN_RATE],
          },
        }}
      />
    </div>
  );
}

export default ResntRateDashboard;
