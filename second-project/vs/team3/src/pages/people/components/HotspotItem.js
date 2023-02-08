/* eslint-disable react/style-prop-object */
/* eslint-disable jsx-a11y/anchor-is-valid */
/* eslint-disable react/prop-types */

import { Grid } from "@mui/material";

function HotspotItem({ spot, setSpot, setSpotId }) {
  const { spotNum, spotName, spotId } = spot;

  return (
    <Grid item display="inline-block" mt={3} ml={3}>
      <a
        href="#"
        onClick={(e) => {
          e.preventDefault();
          setSpot(spotName);
          setSpotId(spotId);
          console.log(spotId);
        }}
      >
        {spotName}
      </a>
    </Grid>
  );
}

export default HotspotItem;
