import { Stack } from "@mui/system";
import MDBox from "components/MDBox";
import MDButton from "components/MDButton";
import MDInput from "components/MDInput";

// eslint-disable-next-line react/prop-types
function NewsSearch({ searchChange, searchHandler, preQuery, aboutSeoul }) {
  return (
    <>
      <MDBox
        height={200}
        mb={1.5}
        p={5}
        variant="gradient"
        borderRadius="lg"
        shadow="lg"
        opacity={1}
      >
        <Stack>
          <MDInput
            type="search"
            label="Search"
            size="large"
            value={preQuery}
            onChange={searchChange}
          />
        </Stack>
        <br />
        <MDButton
          fullWidth
          variant="gradient"
          color="success"
          size="medium"
          onClick={searchHandler}
        >
          SEARCH
        </MDButton>
      </MDBox>
      <MDBox
        display="flex"
        mb={1.5}
        p={5}
        variant="gradient"
        borderRadius="lg"
        shadow="lg"
        opacity={1}
      >
        <MDButton fullWidth variant="gradient" color="warning" size="medium" onClick={aboutSeoul}>
          ABOUT 서울
        </MDButton>
      </MDBox>
    </>
  );
}

export default NewsSearch;
