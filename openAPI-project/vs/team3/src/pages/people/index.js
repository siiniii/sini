/* eslint-disable prettier/prettier */
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
import Divider from "@mui/material/Divider";
import MDTypography from "components/MDTypography";
import DataTable from "layouts/Tables/DataTable";
import { useEffect, useState } from "react";
import axios from "axios";
import { Stack, textAlign } from "@mui/system";
import VerticalBarChart from "layouts/Charts/BarCharts/VerticalBarChart";
import DefaultDoughnutChart from "layouts/Charts/DoughnutCharts/DefaultDoughnutChart";
import PeopleDoughnutChart from "layouts/Charts/DoughnutCharts/PeopleDoughnutChart";
import HotspotPaging from "./components/HotspotPaging";
import HotspotList from "./components/HotspotList";
import AgeRateDashboard from "./components/AgeRateDashboard";
import ResntRateDashboard from "./components/ResntRateDashboard";
import GenderRateDashboard from "./components/GenderRateDashboard";
import PeopleTable from "./components/PeopleTable";
import CongestDashboard from "./components/CongestDashboard";

function People() {
  const [start, setStart] = useState(1);
  const [end, setEnd] = useState(5);
  // const [area, setArea] = useState(""); // 초기값
  const [hotspots, setHotspots] = useState([]); // 초기값
  const [startNum, setStartNum] = useState(1);
  const [endNum, setEndNum] = useState(10);

  const [spot, setSpot] = useState("");
  const [spotId, setSpotId] = useState("");

  useEffect(() => {
    const loadHotspot = async () => {
      const response = await axios.get(
        `/react-team3/people/load-hotspot-data?startNum=${startNum}&endNum=${endNum}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      // console.log(response.data);
      setHotspots(response.data);
    };
    loadHotspot();
  }, [startNum, endNum]);

  const [data, setData] = useState({ stts: [], congestions: [] });
  useEffect(() => {
    const loadData = async () => {
      if (spot.length !== 0) {
        // 1번째 요청
        const url = `http://openapi.seoul.go.kr:8088/485468726861733936324b796a5150/xml/citydata/1/5/${spot}`;
        const response = await axios.get(url);
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(response.data, "text/xml");

        const data2 = xmlDoc.getElementsByTagName("LIVE_PPLTN_STTS");
        const stts = data2[1];
        const data3 = {
          AREA_CONGEST_LVL: stts.getElementsByTagName("AREA_CONGEST_LVL")[0].textContent,
          AREA_CONGEST_MSG: stts.getElementsByTagName("AREA_CONGEST_MSG")[0].textContent,
          AREA_PPLTN_MIN: stts.getElementsByTagName("AREA_PPLTN_MIN")[0].textContent,
          AREA_PPLTN_MAX: stts.getElementsByTagName("AREA_PPLTN_MAX")[0].textContent,
          MALE_PPLTN_RATE: stts.getElementsByTagName("MALE_PPLTN_RATE")[0].textContent,
          FEMALE_PPLTN_RATE: stts.getElementsByTagName("FEMALE_PPLTN_RATE")[0].textContent,
          PPLTN_RATE_0: stts.getElementsByTagName("PPLTN_RATE_0")[0].textContent,
          PPLTN_RATE_10: stts.getElementsByTagName("PPLTN_RATE_10")[0].textContent,
          PPLTN_RATE_20: stts.getElementsByTagName("PPLTN_RATE_20")[0].textContent,
          PPLTN_RATE_30: stts.getElementsByTagName("PPLTN_RATE_30")[0].textContent,
          PPLTN_RATE_40: stts.getElementsByTagName("PPLTN_RATE_40")[0].textContent,
          PPLTN_RATE_50: stts.getElementsByTagName("PPLTN_RATE_50")[0].textContent,
          PPLTN_RATE_60: stts.getElementsByTagName("PPLTN_RATE_60")[0].textContent,
          PPLTN_RATE_70: stts.getElementsByTagName("PPLTN_RATE_70")[0].textContent,
          RESNT_PPLTN_RATE: stts.getElementsByTagName("RESNT_PPLTN_RATE")[0].textContent,
          NON_RESNT_PPLTN_RATE: stts.getElementsByTagName("NON_RESNT_PPLTN_RATE")[0].textContent,
        };
        
        // 2번째 요청
        const url2 = `/react-team3/people/load-congestions?spotId=${spotId}`;
        
        const response2 = await axios.request(url2);
        console.log(response2.data)
        setData({ stts: data3, congestions: response2.data });

        // 3번째 요청
        const url3 = `/react-team3/people/load-spotId?spotName=${spot.spotName}`;
      }      
    }
    loadData();
    
  }, [spot]);

  const [active, setActive] = useState([
    true,
  ]);
  const [page, setPage] = useState(1);
  const pageHandler = (e) => {
    switch (e) {
      case 1:
        setActive([true, false, false, false, false]);
        setPage(1);
        setStartNum(1);
        setEndNum(10);
        break;
      case 2:
        setActive([false, true, false, false, false]);
        setPage(2);
        setStartNum(11);
        setEndNum(20);
        break;
      case 3:
        setActive([false, false, true, false, false]);
        setPage(3);
        setStartNum(21);
        setEndNum(30);
        break;
      case 4:
        setActive([false, false, false, true, false]);
        setPage(4);
        setStartNum(31);
        setEndNum(40);
        break;
      case 5:
        setActive([false, false, false, false, true]);
        setPage(5);
        setStartNum(41);
        setEndNum(50);
        break;

        default:
          break;
    }
  };
  const prevHandler = () => {
    switch (page) {
      case 2:
        pageHandler(1);
        break;
      case 3:
        pageHandler(2);
        break;
      case 4:
        pageHandler(3);
        break;
      case 5:
        pageHandler(4);
        break;
      default:
        break;
    }
  };
  const nextHandler = () => {
    switch (page) {
      case 1:
        pageHandler(2);
        break;
      case 2:
        pageHandler(3);
        break;
      case 3:
        pageHandler(4);
        break;
      case 4:
        pageHandler(5);
        break;
      case 5:
        pageHandler(6);
        break;
      default:
        break;
    }
  };

  return (
    <DashboardLayout>
      <DashboardNavbar />
      <MDBox py={3}>
        <Grid container spacing={3}>
          <Grid item xs={12}>
            <Card>
              <MDBox> 
                {/* 장소 리스트 */} 
                <HotspotList hotspots={hotspots} setSpot ={setSpot} setSpotId={setSpotId} />
              </MDBox>
              <MDBox mt={1} p={1}>
                <Stack alignItems="center">
                {/* 장소 페이징 */} 
                <HotspotPaging 
                  active={active}
                  pageHandler={pageHandler}
                  prevHandler={prevHandler}
                  nextHandler={nextHandler}
                  />
                </Stack>
              </MDBox>           
            </Card>
          </Grid>
        </Grid>
        <Grid container spacing={3} py={3}>
          <Grid item xs={12} md={6} lg={12}>
              <MDBox
                // mb={3} 
                // ml={2}
                // display="flex"
                // justifyContent="space-between"
                // alignItems="center"
                />
               <PeopleTable data={data.stts} spot={spot} />
           
          </Grid>
          {/* <Grid item xs={12} md={6} lg={5}>
            <Card>
              <MDBox
                // mb={2}
                // display="flex"
                // justifyContent="space-between"
                // alignItems="center"
                // p={25}
              >
              <CongestDashboard congestions={data.congestions} />
              </MDBox>
            </Card>
          </Grid> */}
        </Grid>
        <MDBox>
          <Grid container spacing={3}>
            <Grid item xs={12}>
                
                <MDBox 
                display="flex" justifyContent="space-between" alignItems="center">
                  <Card>
                 <Stack
                    direction="row"
                    divider={<Divider orientation="vertical" flexItem />}
                    spacing={8}
                  ><h3>실시간 인구 구성 비율</h3>
                    <MDBox>
                    <GenderRateDashboard data={data.stts} />
                    </MDBox>

                    <MDBox>
                      <AgeRateDashboard data={data.stts} />
                    </MDBox>

                    <MDBox>
                      <ResntRateDashboard data={data.stts} />
                    </MDBox>
                    
                  </Stack>
                  </Card>
                </MDBox>
            </Grid> 
          </Grid>
        </MDBox>
      </MDBox>
      <Footer />
    </DashboardLayout>
  );
}

export default People;