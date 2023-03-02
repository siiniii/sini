/* eslint-disable prettier/prettier */
// @mui material components
import Grid from "@mui/material/Grid";

// Material Dashboard 2 React components
import MDBox from "components/MDBox";

// Material Dashboard 2 React example components
import DashboardLayout from "layouts/LayoutContainers/DashboardLayout";
import DashboardNavbar from "layouts/Navbars/DashboardNavbar";
import Footer from "layouts/Footer";

// Dashboard components
import { Card } from "@mui/material";
import { useCallback, useEffect, useState } from "react";
import axios from "axios";
import WeatherTable from "pages/weather/components/WeatherTable";
import WeatherList from "pages/weather/components/WeatherList";
import MDInput from "components/MDInput";
import { Stack } from "@mui/system";
import MDButton from "components/MDButton";
import MDTypography from "components/MDTypography";
import SpotList from "pages/weather/components/SpotList";
import TimelineList from "layouts/Timeline/TimelineList";
import WeatherAirList from "./components/WeatherAirList";
import WeatherNewsList from "./components/WeatherNewsList";
import WeatherAirDirty from "./components/WeatherAirDirty";

function Weather(props) {

  const [areanm, setareanm] = useState("");
  const [start, setstart] = useState(0);
  const [end, setend] = useState(5);

  const [newsData, setNewsData] = useState([]);
  const [airData, setAirData] = useState([]);
  const [airDirtyData, setAirDirtyData] = useState([]);
  const [weatherData, setWeatherData] = useState([]);
  const [tableData, setTableData] = useState([]);
  
  const [preWeatherSpot, setPreWeatherSpot] = useState("");
  const [hotspot, setHotspot] = useState("");
  const [hotspotList, setHotspotList] = useState([]);
  
  const [spots, setSpots] = useState([]);
  const [selectedSpot, setSelectedSpot] = useState("");

  // SpotList
  const loadSpotName = async (e) => {
    const response = await axios.get (
      `/react-team3/weather/load-spotByGroup?group=${e}`
    )
    setSpots(response.data);
  };

  const loadSpotSearch = async (e) => {
    const response = await axios.get (
      `/react-team3/weather/load-spotBySearch?spot=${e}`
    )
    setSpots(response.data);
  };

  // 클릭한 핫스팟 정보 조회
  const selectSpotHandler = useCallback((e) => {
    setSelectedSpot(e);
  }, []);

  useEffect(() => {

    if (selectedSpot.length !== 0) {
      const url = `http://openapi.seoul.go.kr:8088/6f4e644e5070617231303879746c766c/xml/citydata/1/5/${selectedSpot}`;
    axios.get(url).then((response) => {
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(response.data, "text/xml");

      const data2 = xmlDoc.getElementsByTagName("WEATHER_STTS");
      const stts = data2[1];

      const tableStts = xmlDoc.getElementsByTagName("FCST24HOURS");
      const newTableDatas = [];
      console.log(tableStts[1]);
      // eslint-disable-next-line no-plusplus
      for (let i = 1; i < tableStts.length; i++) {
        const newTableData = { 
          TIME: tableStts[i].getElementsByTagName("FCST_DT")[0].textContent.substr(8, 2),
          TEMP: tableStts[i].getElementsByTagName("TEMP")[0].textContent,
          PRECIPITATION: tableStts[i].getElementsByTagName("PRECIPITATION")[0].textContent,
          RAIN_CHANCE: tableStts[i].getElementsByTagName("RAIN_CHANCE")[0].textContent,
          SKY_STTS: tableStts[i].getElementsByTagName("SKY_STTS")[0].textContent,
        }
        newTableDatas.push(newTableData);
      }

      const newWeatherData = {
        AREA_NM: selectedSpot,
        WEATHER_TIME: stts.getElementsByTagName("WEATHER_TIME")[0].textContent,
        MAX_TEMP: stts.getElementsByTagName("MAX_TEMP")[0].textContent,
        MIN_TEMP: stts.getElementsByTagName("MIN_TEMP")[0].textContent,
        PCP_MSG: stts.getElementsByTagName("PCP_MSG")[0].textContent,
        SENSIBLE_TEMP: stts.getElementsByTagName("SENSIBLE_TEMP")[0].textContent,
      };

      const newNewsData = {
        WEATHER_TIME: stts.getElementsByTagName("ANNOUNCE_TIME")[0].textContent,
        WARN_VAL: stts.getElementsByTagName("WARN_VAL")[0].textContent,
        WARN_STRESS: stts.getElementsByTagName("WARN_STRESS")[0].textContent,
        WARN_MSG: stts.getElementsByTagName("WARN_MSG")[0].textContent,
      };

      const newAirDirtyData = {
        WEATHER_TIME: stts.getElementsByTagName("WEATHER_TIME")[0].textContent,
        PM25_INDEX: stts.getElementsByTagName("PM25_INDEX")[0].textContent,
        PM25: stts.getElementsByTagName("PM25")[0].textContent,
        PM10_INDEX: stts.getElementsByTagName("PM10_INDEX")[0].textContent,
        PM10: stts.getElementsByTagName("PM10")[0].textContent,
        AIR_IDX: stts.getElementsByTagName("AIR_IDX")[0].textContent,
        AIR_MSG: stts.getElementsByTagName("AIR_MSG")[0].textContent,
      }

      const newAirData = {
          AREA_NM: selectedSpot,
          WEATHER_TIME: stts.getElementsByTagName("WEATHER_TIME")[0].textContent,
          UV_INDEX: stts.getElementsByTagName("UV_INDEX")[0].textContent,
          UV_INDEX_LVL: stts.getElementsByTagName("UV_INDEX_LVL")[0].textContent,
          UV_MSG: stts.getElementsByTagName("UV_MSG")[0].textContent,
        };

        setAirData(newAirData);
        setAirDirtyData(newAirDirtyData);
        setWeatherData(newWeatherData);
        setNewsData(newNewsData);
        setTableData(newTableDatas);
    });
    }
    
  }, [selectedSpot]);  


  useEffect(() => {
    const loadWeather = async () => {
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
    };
    loadWeather();
  }, []);

  useEffect(() => {
    const loadWeather = async () => {
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
    };
    loadWeather();
  }, []);

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
              p={15}
            >
              날씨
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              bgColor="white"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={9.2}
            >
              <MDTypography>
              <Stack>
                <MDInput 
                type="search"
                label="Area"
                size="large"
                value={preWeatherSpot}
                onChange={(e) => {
                  setPreWeatherSpot(e.target.value);
                }}
                />
              </Stack>
            <br />
              <Stack>
                <MDButton 
                variant="gradient" 
                color="info" 
                size="large"
                onClick={() => {
                  if (preWeatherSpot.length === 0) {
                    alert("장소를 입력하세요");
                    return;
                  }
                  loadSpotSearch(preWeatherSpot);
                  setPreWeatherSpot("");
                }}
                
                >검색
                </MDButton>
              </Stack>
              </MDTypography>
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
              mb={1.5}
              height={270}
              color="black"
              bgColor="white"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={6}
            >
              {/* 핫스팟 50 목록 클릭 */}
              <MDButton
                fullWidth
                variant="gradient"
                color="light"
                size="small"
                onClick={() => {
                  loadSpotName("관광 특구");
                }}
                 >
                  관광특구
                  </MDButton>
                  <MDButton
                fullWidth
                variant="gradient"
                color="light"
                size="small"
                onClick={() => {
                  loadSpotName("고궁 문화유산");
                }}
                >
                  고궁 문화유산
                </MDButton>
                  <MDButton
                fullWidth
                variant="gradient"
                color="light"
                size="small"
                onClick={() => {
                  loadSpotName("인구 밀집지역");
                }}
                >
                인구 밀집지역
                </MDButton>
                  <MDButton
                fullWidth
                variant="gradient"
                color="light"
                size="small"
                onClick={() => {
                  loadSpotName("발달 상권");
                }}
                >
                발달 상권
                </MDButton>
                  <MDButton
                fullWidth
                variant="gradient"
                color="light"
                size="small"
                onClick={() => {
                  loadSpotName("공원");
                }}
                >
                공원
                </MDButton>
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
              p={15}
            >
              환경
            </MDBox>
          </Grid>
        </Grid>
        <Grid container spacing={3}>
          <SpotList spots={spots} selectSpotHandler={selectSpotHandler} />
        </Grid>
        <Grid container spacing={3}>
          <Grid item xs={12} md={6} lg={12}>
            <Card>
              <MDBox pd={5} mt={2} mb={1} ml={3}>
                <h3>서울 24시간 날씨 예보</h3>
              </MDBox>
              <MDBox
              // mb={1.5} justifyContent="space-between" alignItems="center" p={30}
              >
                <WeatherTable datas={tableData} />
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={6}>
            <Card>
              <MDBox mb={1.5} 
                  justifyContent="space-between" 
                  alignItems="center" 
                  p={9} 
                 > 
                 {/* 기상 정보 */}
                 <section className="container">
                    <div className="weatherInfo">
                        <WeatherList weatherData = {weatherData}
                        />
                    </div>
                 </section>
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={6}>
            <Card>
              <MDBox 
              mb={1.5} 
              justifyContent="space-between" 
              alignItems="center" 
              p={7}
              >
               {/* 기상 뉴스 */}
               <section className="container">
                  <div className="weatherInfo">
                      <WeatherNewsList newsData = {newsData}
                      />
                  </div>
                </section>
               </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={6}>
            <Card>
              <MDBox 
                 // mb={1.5} 
                 // justifyContent="space-between" 
                 // alignItems="center" 
                 // p={7} 
                 > 
                {/* 대기 환경 */}
                <section className="container">
                  <div className="weatherInfo">
                      <WeatherAirList airData = {airData}
                      />
                  </div>
                </section>
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={6}>
            <Card>
              <MDBox 
                   bgColor="white"
                   variant="gradient"
                   justifyContent="space-between" 
                   borderRadius="lg"
                   shadow="lg"
                   opacity={1}
                   alignItems="center" 
                   p={5}
                 >
                {/* 대기 오염 */}
                <section className="container">
                  <div className="weatherInfo">
                      <WeatherAirDirty airDirtyData = {airDirtyData}
                      />
                  </div>
                </section>
              </MDBox>
            </Card>
          </Grid>
        </Grid>
      </MDBox>
      <Footer />
    </DashboardLayout>
  );
}
export default Weather;
