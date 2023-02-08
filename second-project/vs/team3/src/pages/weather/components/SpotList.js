/* eslint-disable react/prop-types */
/* eslint-disable jsx-a11y/anchor-is-valid */
import { Grid } from "@mui/material";
import MDBadge from "components/MDBadge";
import MDBox from "components/MDBox";

function SpotList({ spots, selectSpotHandler }) {
  const key = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
    27, 28, 29, 30,
  ];

  return (
    <div>
      {spots.length !== 0 ? (
        spots.map((spot, idx) => (
          <Grid key={key[idx]} item display="inline-block" mb={2} mt={3} ml={3}>
            <a
              href="#"
              onClick={(e) => {
                e.preventDefault();
                selectSpotHandler(spot.spot);
              }}
            >
              <MDBox
                height={50}
                bgColor="light"
                variant="gradient"
                color="black"
                borderRadius="lg"
                opacity={1}
                p={1}
              >
                <h5>{spot.spot}</h5>
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
            borderRadius="lg"
            opacity={1}
            p={1}
          >
            <h4>장소를 선택 하세요!</h4>
          </MDBox>
        </Grid>
      )}
    </div>
  );
}

export default SpotList;
