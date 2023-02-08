// @mui material components
import Grid from "@mui/material/Grid";

// Material Dashboard 2 React components
import MDBox from "components/MDBox";

// Material Dashboard 2 React example components
import DashboardLayout from "layouts/LayoutContainers/DashboardLayout";
import DashboardNavbar from "layouts/Navbars/DashboardNavbar";
import Footer from "layouts/Footer";
import ReportsBarChart from "layouts/Charts/BarCharts/ReportsBarChart";
import ReportsLineChart from "layouts/Charts/LineCharts/ReportsLineChart";
import ComplexStatisticsCard from "layouts/Cards/StatisticsCards/ComplexStatisticsCard";

// Data
import reportsBarChartData from "pages/dashboard/data/reportsBarChartData";
import reportsLineChartData from "pages/dashboard/data/reportsLineChartData";

// Dashboard components
import Projects from "pages/dashboard/components/Projects";
import OrdersOverview from "pages/dashboard/components/OrdersOverview";
import { Card, Icon } from "@mui/material";
import MDTypography from "components/MDTypography";
import DataTable from "layouts/Tables/DataTable";

function Corona() {
  return (
    <DashboardLayout>
      <DashboardNavbar />
      <MDBox py={3}>
        <Grid container spacing={3}>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              color="white"
              bgColor="info"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={10}
            >
              코로나
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              color="white"
              bgColor="success"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={10}
            >
              EX.2
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              color="white"
              bgColor="primary"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={10}
            >
              EX.3
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              color="white"
              bgColor="secondary"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={10}
            >
              EX.4
            </MDBox>
          </Grid>
        </Grid>
        <Grid container spacing={3}>
          <Grid item xs={12} md={6} lg={8}>
            <Card>
              <MDBox
                mb={1.5}
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                p={25}
              >
                화면 1
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={4}>
            <Card>
              <MDBox
                mb={1.5}
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                p={25}
              >
                화면 2
              </MDBox>
            </Card>
          </Grid>
        </Grid>
        <MDBox mt={1.5}>
          <Grid container spacing={3}>
            <Grid item xs={12} md={6} lg={6}>
              <Card>
                <MDBox display="flex" justifyContent="space-between" alignItems="center" p={20}>
                  예졔 3
                </MDBox>
              </Card>
            </Grid>
            <Grid item xs={12} md={6} lg={6}>
              <Card>
                <MDBox display="flex" justifyContent="space-between" alignItems="center" p={20}>
                  예제 4
                </MDBox>
              </Card>
            </Grid>
          </Grid>
        </MDBox>
      </MDBox>
      <Footer />
    </DashboardLayout>
  );
}

export default Corona;
