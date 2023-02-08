/* eslint-disable jsx-a11y/anchor-is-valid */
import { Grid } from "@mui/material";
import MDBadge from "components/MDBadge";
import MDBox from "components/MDBox";

/* eslint-disable react/prop-types */
function StationList({ stations, selectStationHandler, selectStationLineHandler }) {
  const key = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
    27, 28, 29, 30,
  ];

  return (
    <div>
      {stations.length !== 0 ? (
        stations.map((station, idx) => (
          <Grid key={key[idx]} item display="inline-block" mb={2} mt={3} ml={3}>
            <a
              href="#"
              onClick={(e) => {
                // eslint-disable-next-line no-unused-expressions
                e.preventDefault();
              }}
            >
              <MDBox
                height={50}
                bgColor={station.color}
                color="white"
                borderRadius="10rem"
                opacity={1}
                p={1}
                onClick={(e) => {
                  const { name } = station;
                  selectStationHandler(name);
                  const { line } = station;
                  selectStationLineHandler(line);
                }}
              >
                <h5>
                  {station.line} {station.name}
                </h5>
              </MDBox>
            </a>
          </Grid>
        ))
      ) : (
        <Grid item display="inline-block" mb={2} mt={3} ml={3}>
          <MDBox
            height={50}
            bgColor="light"
            variant="gradient"
            color="black"
            borderRadius="10rem"
            opacity={1}
            p={1}
          >
            <h4>역 이름을 검색 하세요!</h4>
          </MDBox>
        </Grid>
      )}
    </div>
  );
}

export default StationList;
