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

function WeatherNewsList({ newsData }) {
  return (
    <Box sx={{ width: "100%" }}>
      <div>
        <h3>기상 뉴스</h3>
        <h5>{newsData.WEATHER_TIME}</h5>
      </div>
      <br />
      <Grid container rowSpacing={1} columnSpacing={{ xs: 1, sm: 2, md: 3 }}>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>기상특보</h3> <span>{newsData.WARN_VAL}</span>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            {" "}
            <h3>기상특보강도</h3> <span>{newsData.WARN_STRESS}</span>
          </Item>
          <br />
        </Grid>
        <Grid item xs={12}>
          <TimelineItem
            py={30}
            color="primary"
            icon="inventory_2"
            title="기상특보 행동강령"
            description={newsData.WARN_MSG}
            badges={["order", "#1832412"]}
          />
        </Grid>
      </Grid>
    </Box>
  );
}

export default WeatherNewsList;
