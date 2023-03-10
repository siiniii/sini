import { Grid } from "@mui/material";
import MDBox from "components/MDBox";

// eslint-disable-next-line react/prop-types
function NewsTitle({ query }) {
  return (
    <>
      <Grid item xs={12} md={6} lg={6}>
        <MDBox
          mb={1.5}
          display="flex"
          color="white"
          bgColor="info"
          variant="gradient"
          borderRadius="lg"
          shadow="lg"
          opacity={1}
          p={3}
          maxWidth
          textAlign="center"
        >
          NEWS
        </MDBox>
      </Grid>
      <Grid item xs={12} md={6} lg={6}>
        <MDBox
          mb={1.5}
          display="flex"
          color="white"
          bgColor="info"
          variant="gradient"
          borderRadius="lg"
          shadow="lg"
          opacity={1}
          p={3}
          maxWidth
          textAlign="center"
        >
          ABOUT {query}
        </MDBox>
      </Grid>
    </>
  );
}

export default NewsTitle;
