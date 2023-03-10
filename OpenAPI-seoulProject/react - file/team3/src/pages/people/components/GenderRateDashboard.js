/* eslint-disable no-param-reassign */
/* eslint-disable react/prop-types */
import DefaultDoughnutChart from "layouts/Charts/DoughnutCharts/DefaultDoughnutChart";

function GenderRateDashboard({ data }) {
  if (data.length === 0) {
    data.MALE_PPLTN_RATE = 50;
    data.FEMALE_PPLTN_RATE = 50;
  }

  return (
    <div>
      <DefaultDoughnutChart
        // icon={{ color: "info", component: "leaderboard" }}
        title="성별 비율"
        description="Affiliates program"
        chart={{
          labels: ["남성", "여성"],
          datasets: {
            label: "Projects",
            backgroundColors: ["info", "dark"],
            data: [data.MALE_PPLTN_RATE, data.FEMALE_PPLTN_RATE],
          },
        }}
      />
    </div>
  );
}

export default GenderRateDashboard;
