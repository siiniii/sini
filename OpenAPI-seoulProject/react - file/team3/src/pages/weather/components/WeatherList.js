/* eslint-disable react/prop-types */
import * as React from "react";
import Divider from "@mui/material/Divider";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import Stack from "@mui/material/Stack";
import { styled } from "@mui/material/styles";
import TimelineItem from "layouts/Timeline/TimelineItem";
import { Box } from "@mui/system";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: "center",
  color: theme.palette.text.secondary,
}));

// 날씨 정보
function WeatherList({ weatherData }) {
  return (
    <Box sx={{ width: "100%" }}>
      <div>
        <h3>실시간 날씨 예보</h3>
        <h5>{weatherData.WEATHER_TIME}</h5>
      </div>
      <br />
      <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }}>
        <Grid item xs={4}>
          <Item>
            {" "}
            <h3>최고기온</h3> <span>{weatherData.MAX_TEMP} °C</span>
          </Item>
        </Grid>
        <Grid item xs={4}>
          <Item>
            {" "}
            <h3>최저기온</h3> <span>{weatherData.MIN_TEMP} °C</span>
          </Item>
          <br />
        </Grid>
        <Grid item xs={4}>
          <Item>
            {" "}
            <h3>체감온도</h3> <span>{weatherData.SENSIBLE_TEMP} °C</span>
          </Item>
          <br />
        </Grid>
        <br />
      </Grid>
      <Grid item xs={12}>
        <TimelineItem
          py={30}
          color="primary"
          icon="inventory_2"
          title="기상 상황"
          description={weatherData.PCP_MSG}
          badges={["order", "#1832412"]}
        />
      </Grid>
    </Box>
  );
}
export default WeatherList;

// function WeatherList({ weatherData }) {
//   return (
//     <div className="weatherList">
//       <h3>실시간 날씨 정보</h3>
//       <h5>{weatherData.ANNOUNCE_TIME}</h5>
//         <table border={1} padding={2}>
//           <thead>
//           <tr>
//             <th>최고기온</th>
//             <th>최저기온</th>
//             <th>체감온도</th>
//           </tr>
//           </thead>
//           <tbody>
//           <tr>
//             <td>{weatherData.AREA_NM}</td>
//             <td>{weatherData.MAX_TEMP}</td>
//             <td>{weatherData.MIN_TEMP}</td>
//             <td>{weatherData.SENSIBLE_TEMP}</td>
//           </tr>
//           </tbody>
//           <tfoot />
//         </table>
//     </div>
//   );
// }
