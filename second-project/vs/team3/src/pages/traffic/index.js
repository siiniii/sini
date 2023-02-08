/* eslint-disable prettier/prettier */
/* eslint-disable no-undef */
// @mui material components
import Grid from "@mui/material/Grid";

// Material Dashboard 2 React components
import MDBox from "components/MDBox";

// Material Dashboard 2 React example components
import DashboardLayout from "layouts/LayoutContainers/DashboardLayout";
import DashboardNavbar from "layouts/Navbars/DashboardNavbar";
import Footer from "layouts/Footer";

// Data

// Dashboard components
import { Card } from "@mui/material";
import MDTypography from "components/MDTypography";
import { useCallback, useEffect, useState } from "react";
import axios from "axios";
import MDInput from "components/MDInput";
import MDButton from "components/MDButton";
import SpotList from "pages/transport/components/SpotList";
import { Stack } from "@mui/system";
import TrafficTable from "./components/TrafficTable";
import TrafficList from "./components/TrafficList";
import CctvTable from "./components/CctvTable";
import CctvVideo from "./components/React-player";

function Traffic(props) {
  const [cctvDisplay, setCctvDisplay] = useState("none");
  const [sttsDisplay, setSttsDisplay] = useState("");
  const [start, setStart] = useState(0);
  const [end, setend] = useState(30);
  const [preQuery, setPreQuery] = useState("");
  const [areaNM, setAreaNM] = useState("");
  const [trafficTable, setTrafficTable] = useState([]);
  const [trafficTable2, setTrafficTable2] = useState({ ROAD_MSG: "", ROAD_TRAFFIC_IDX: "", ROAD_TRFFIC_TIME: "" });
  const [data, setData] = useState([]);
  const [spots, setSpots] = useState([]);
  const [selectedSpot, setSelectedSpot] = useState("");

  const [cctv, setCctv] = useState([]);
  const [cctvUrl, setCctvUrl] = useState("");
  const [type, setType] = useState("ex");


  const cctvToggleHandler = useCallback(() => {
    setCctvDisplay("");
    setSttsDisplay("none");
  }, []);

  const sttsToggleHandler = useCallback(() => {
    setCctvDisplay("none");
    setSttsDisplay("");
  }, []);

  // SpotList
  const loadSpotName = async (e) => {
    const response = await axios.get(
      `/react-team3/traffic/load-spotGroup?group=${e}`
    );
    // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
    setSpots(response.data);
  };

  

  // useEffect(() => {
  //   const loadhotspotData = async () => {
  //     const response = await axios.get(
  //       `/react-team3/traffic/load-hotspot-data`
  //     );
  //     console.log(response.data);
  //   };
  //   loadhotspotData();
  // }, []);

  useEffect(() => {
    const loadTrafficStts = async () => {
      const response = await axios.get(
        `/react-team3/traffic/load-traffic-stts?start=${start}&end=${end}&areaNM=${areaNM}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      setTrafficTable(response.data);
    };
    loadTrafficStts();
  }, [areaNM]);

  useEffect(() => {
    if (selectedSpot.length !== 0) {
      const url = `http://openapi.seoul.go.kr:8088/4b6e7350456a6f7936387961484346/xml/citydata/1/5/${selectedSpot}`;
    axios.get(url).then((response) => {
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(response.data, "text/xml");

      const data2 = xmlDoc.getElementsByTagName("ROAD_TRAFFIC_STTS");
      const roadMsg = xmlDoc.getElementsByTagName("ROAD_MSG")[0].textContent;
      const trafficIdx = xmlDoc.getElementsByTagName("ROAD_TRAFFIC_IDX")[0].textContent;
      const trafficTime = xmlDoc.getElementsByTagName("ROAD_TRFFIC_TIME")[0].textContent;
      const data3 = [];
      for (let i = 1; i < data2.length; i += 1) {
        const stts = data2[i];
       
        const ROAD_NM = stts.getElementsByTagName("ROAD_NM")[0].textContent;
        const START_ND_NM = stts.getElementsByTagName("START_ND_NM")[0].textContent;
        const END_ND_NM = stts.getElementsByTagName("END_ND_NM")[0].textContent;
        const newRoadNm = `${ROAD_NM}: [시작]${START_ND_NM} [종료]${END_ND_NM}`;

        const ROAD_MSG = roadMsg;
        const ROAD_TRAFFIC_IDX = trafficIdx;
        const ROAD_TRFFIC_TIME = trafficTime;

        // data3.push({
        //   ROAD_NM: newRoadNm,
        //   ROAD_MSG: roadMsg,
        //   ROAD_TRAFFIC_IDX: trafficIdx,
        //   ROAD_TRFFIC_TIME: trafficTime,
        //   SPD: stts.getElementsByTagName("SPD")[0].textContent,
        //   IDX: stts.getElementsByTagName("IDX")[0].textContent,
        // });

        data3.push({
          ROAD_NM: stts.getElementsByTagName("ROAD_NM")[0].textContent,
          START_ND_NM: stts.getElementsByTagName("START_ND_NM")[0].textContent,
          END_ND_NM : stts.getElementsByTagName("END_ND_NM")[0].textContent,
          ROAD_MSG: roadMsg,
          ROAD_TRAFFIC_IDX: trafficIdx,
          ROAD_TRFFIC_TIME: trafficTime,
          SPD: stts.getElementsByTagName("SPD")[0].textContent,
          IDX: stts.getElementsByTagName("IDX")[0].textContent,
        });
        
        
      }
      setTrafficTable(data3);
      setTrafficTable2({ ROAD_MSG: roadMsg, ROAD_TRAFFIC_IDX: trafficIdx, ROAD_TRFFIC_TIME: trafficTime });
      
    });
    }
  }, [selectedSpot]);

  // 클릭한 핫스팟 정보 조회
  const selectSpotHandler = useCallback((e) => {
    setSelectedSpot(e);
  }, []);


  // 실시간 cctv 영상조회
  useEffect(() => {
    const loadCctv = async () => {
      const response = await axios.get(
        `/react-team3/traffic/load-cctv?type=${type}`
      );
      setCctv(response.data);
    };
    loadCctv();
  }, [type]);

  return (
    <DashboardLayout>
      <DashboardNavbar />
      <MDBox py={3}>
        <Grid container spacing={3}>
          <Grid item xs={12} md={6} lg={3} >
            <MDBox
              height={250}
              mb={1.5}
              bgColor="white"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={9.2}
            >
              도로소통현황
              <br />
              <br />
              {/* 핫스팟 검색 */}
              <MDTypography>
              <Stack>
                <MDInput
                  type="search"
                  label="장소를 입력하세요"
                  value={preQuery}
                  size="large"
                  onChange={(e) => {
                    setPreQuery(e.target.value);
                  }}
                />
                </Stack>

                <Stack>
                <MDButton
                  variant="gradient"
                  color="info"
                  size="large"
                  onClick={() => {
                    setAreaNM(preQuery);
                    setPreQuery("");
                  }}
                >
                  검색
                </MDButton>
                </Stack>
              </MDTypography> 
              
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3} display={sttsDisplay}>
          <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="success"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={9}
                >
                 <MDButton
                    fullWidth
                    variant="gradient"
                    color="success"
                    size="large"
                    onClick={cctvToggleHandler}
                  >
                    CCTV 조회
                  </MDButton>
                
                </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3} display={cctvDisplay}>
          <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="success"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={6}
                >
                 <MDButton
                    fullWidth
                    variant="gradient"
                    color="success"
                    size="large"
                    onClick={sttsToggleHandler}
                  >
                    도로 상태 조회
                  </MDButton>
                
                </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
            height={250}
              mb={1.5}
              color="white"
              bgColor="primary"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={5}
              lineHeight= "30px"
            >
              <TrafficList datas={trafficTable2}/>
            </MDBox>
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <MDBox
            height={250}
              mb={1.5}
              color="white"
              bgColor="secondary"
              variant="gradient"
              borderRadius="lg"
              shadow="lg"
              opacity={1}
              p={3}
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
                    관광 특구
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
        </Grid>
        
        <Grid container spacing={3}>
          <Grid item xs={12} md={6} lg={12} display={sttsDisplay}>
            
            <Card>
              
                <SpotList spots={spots} selectSpotHandler={selectSpotHandler}/>
             
            
              <MDBox
                
                mb={1.5}
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                p={5}
              >
                {/* 교통테이블 */}
                <TrafficTable datas={trafficTable} />
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={7} display={cctvDisplay}>
            
            <Card>
            <SpotList spots={spots} selectSpotHandler={selectSpotHandler}/>
              <MDBox
                mb={1.5}
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                p={7}
              >
                <CctvVideo url={cctvUrl} />
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={5} display={cctvDisplay}>
            <Card>
            <MDBox
                mb={1.5}
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                p={3}
              >
                {/* CCTV테이블 */}
                <CctvTable datas={cctv} setUrl={setCctvUrl} />
              </MDBox>
            </Card>
          </Grid>
        </Grid>
      </MDBox>
      <Footer />
    </DashboardLayout>
  );
}

export default Traffic;
