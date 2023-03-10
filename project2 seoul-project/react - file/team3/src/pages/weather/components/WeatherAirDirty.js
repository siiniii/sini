/* eslint-disable react/prop-types */
import * as React from "react";
import { styled } from "@mui/material/styles";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Box from "@mui/material/Box";
import TimelineItem from "layouts/Timeline/TimelineItem";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: "center",
  color: theme.palette.text.secondary,
}));

function WeatherAirDirty({ airDirtyData }) {
  return (
    <Box sx={{ width: "100%" }}>
      <div>
        <h3>대기오염 현황</h3>
        <h5>{airDirtyData.WEATHER_TIME}</h5>
      </div>
      <br />
      <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }}>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>초미세먼지지표</h3> <span>{airDirtyData.PM25_INDEX}</span>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>미세먼지지표</h3> <span>{airDirtyData.PM10_INDEX}</span>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>초미세먼지농도</h3> <span>{airDirtyData.PM25}</span>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>미세먼지농도</h3> <span>{airDirtyData.PM10}</span>
          </Item>
        </Grid>
        <Grid item xs={12}>
          <Item>
            {" "}
            <h3>대기환경등급</h3> <span>{airDirtyData.AIR_IDX}</span>
          </Item>
          <br />
        </Grid>
        <Grid item xs={12}>
          <TimelineItem
            py={30}
            color="primary"
            icon="inventory_2"
            title="대기환경 알림"
            description={airDirtyData.AIR_MSG}
            badges={["order", "#1832412"]}
          />
        </Grid>
      </Grid>
    </Box>
  );
}

export default WeatherAirDirty;
