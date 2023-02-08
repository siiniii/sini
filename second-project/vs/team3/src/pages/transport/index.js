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
import MDInput from "components/MDInput";
import MDButton from "components/MDButton";
import { Stack } from "@mui/system";
import StationInfo from "./components/StationInfo";
import StationList from "./components/StationList";
import SpotList from "./components/SpotList";
import BikeKakaoMap from "./components/BikeKakaoMap";
import BikeInfo from "./components/BikeInfo";
import BusKakaoMap from "./components/BusKakaoMap";
import BusInfo from "./components/BusInfo";

function Transport() {
  const [busDisplay, setBusDisplay] = useState("none");
  const [subwayDisplay, setSubwayDisplay] = useState("");
  const [bikeDisplay, setbikeDisplay] = useState("none");

  const busToggleHandler = useCallback(() => {
    setBusDisplay("");
    setSubwayDisplay("none");
    setbikeDisplay("none");
  }, []);

  const subwayToggleHandler = useCallback(() => {
    setBusDisplay("none");
    setSubwayDisplay("");
    setbikeDisplay("none");
  }, []);

  const bikeToggleHandler = useCallback(() => {
    setBusDisplay("none");
    setSubwayDisplay("none");
    setbikeDisplay("");
  }, []);

  const start = 0;
  const end = 30;

  const [preStation, setPreStation] = useState("");
  const [station, setStation] = useState("");
  const [stations, setStations] = useState([]);

  const [selectedStation, setSelectedStation] = useState("");
  const [line, setLine] = useState("");
  const [stationInfo, setStationInfo] = useState([]);

  const [bikeSpots, setBikeSpots] = useState([]);

  const [preBikeSpot, setPreBikeSpot] = useState("");
  const [selectedBikeSpot, setSelectedBikeSpot] = useState("");

  const [bikeInfo, setBikeInfo] = useState([]);

  const [busSpots, setBusSpots] = useState([]);

  const [preBusSpot, setPreBusSpot] = useState("");
  const [selectedBusSpot, setSelectedBusSpot] = useState("");
  const [busStn, setBusStn] = useState("");

  const [busInfoStn, setBusInfoStn] = useState([]);
  const [busInfoDetail, setBusInfoDetail] = useState([]);

  const loadBusSpotName = async (e) => {
    const response = await axios.get(`/react-team3/transport/load-spotByGroup?group=${e}`);
    // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
    setBusSpots(response.data);
  };

  const loadBusSpotNameBySearch = async (e) => {
    const response = await axios.get(`/react-team3/transport/load-spotBySearch?spot=${e}`);
    // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
    setBusSpots(response.data);
  };

  useEffect(() => {
    const loadBusStnInfo = async () => {
      const response = await axios.get(
        `/react-team3/transport/load-busInfoStn?spot=${selectedBusSpot}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);

      setBusInfoStn(response.data);
    };
    loadBusStnInfo();
  }, [selectedBusSpot]);

  useEffect(() => {
    const loadBusDetailInfo = async () => {
      const response = await axios.get(
        `/react-team3/transport/load-busInfoDetail?spot=${selectedBusSpot}&stn=${busStn}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      setBusInfoDetail(response.data);
    };
    loadBusDetailInfo();
  }, [busStn]);

  const loadBikeSpotName = async (e) => {
    const response = await axios.get(`/react-team3/transport/load-spotByGroup?group=${e}`);
    // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
    setBikeSpots(response.data);
  };

  const loadBikeSpotNameBySearch = async (e) => {
    const response = await axios.get(`/react-team3/transport/load-spotBySearch?spot=${e}`);
    // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
    setBikeSpots(response.data);
  };

  useEffect(() => {
    const loadBikeInfo = async () => {
      const response = await axios.get(
        `/react-team3/transport/load-bikeInfo?spot=${selectedBikeSpot}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      setBikeInfo(response.data);
    };
    loadBikeInfo();
  }, [selectedBikeSpot]);

  useEffect(() => {
    const loadStationName = async () => {
      const response = await axios.get(`/react-team3/transport/load-station?name=${station}`);
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);;
      setStations(response.data);
    };
    loadStationName();
  }, [station]);

  useEffect(() => {
    const loadStationInfo = async () => {
      const response = await axios.get(
        `/react-team3/transport/load-subway?station=${selectedStation}&line=${line}&start=${start}&end=${end}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      setStationInfo(response.data);
    };
    loadStationInfo();
  }, [selectedStation, line]);

  const selectStationHandler = useCallback((e) => {
    setSelectedStation(e);
  }, []);
  const selectStationLineHandler = useCallback((e) => {
    setLine(e);
  }, []);

  const selectBikeSpotHandler = useCallback((e) => {
    setSelectedBikeSpot(e);
  }, []);

  const selectBusSpotHandler = useCallback((e) => {
    setBusStn("");
    setSelectedBusSpot(e);
  }, []);
  return (
    <>
      <Stack display={subwayDisplay}>
        <DashboardLayout>
          <DashboardNavbar />
          <MDBox py={3}>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="info"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={10}
                >
                  SUBWAY
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
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
                    onClick={busToggleHandler}
                  >
                    Change To Bus
                  </MDButton>
                  <br />
                  <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="success"
                    size="large"
                    onClick={bikeToggleHandler}
                  >
                    Change To Bike
                  </MDButton>
                </MDBox>
              </Grid>

              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={5}
                >
                  <Stack>
                    <MDInput
                      type="search"
                      label="Station"
                      size="large"
                      value={preStation}
                      onChange={(e) => {
                        setPreStation(e.target.value);
                      }}
                    />
                  </Stack>
                  <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="light"
                    size="medium"
                    onClick={() => {
                      if (preStation.length === 0) {
                        // eslint-disable-next-line no-alert
                        alert("검색어를 입력 하세요!!!");
                        return;
                      }
                      setStation(preStation);
                      setPreStation("");
                    }}
                  >
                    SEARCH
                  </MDButton>
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  mb={1.5}
                  height={250}
                  bgColor="white"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={5}
                >
                  <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="warning"
                    size="large"
                    onClick={() => {
                      window.open("transport/lineMap");
                    }}
                  >
                    지하철 노선 보기
                  </MDButton>
                </MDBox>
              </Grid>
            </Grid>
            <Grid container spacing={3}>
              <StationList
                stations={stations}
                selectStationHandler={selectStationHandler}
                selectStationLineHandler={selectStationLineHandler}
              />
            </Grid>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={12}>
                <Card>
                  <MDBox display="flex" justifyContent="space-between" alignItems="center" p={10}>
                    <StationInfo selectedStation={selectedStation} stationInfo={stationInfo} />
                  </MDBox>
                </Card>
              </Grid>
            </Grid>
          </MDBox>
          <Footer />
        </DashboardLayout>
      </Stack>
      <Stack display={busDisplay}>
        <DashboardLayout>
          <DashboardNavbar />
          <MDBox py={3}>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="info"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={10}
                >
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="info"
                    size="large"
                    onClick={subwayToggleHandler}
                  >
                    Change To Subway
                  </MDButton>
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="success"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={10}
                >
                  BUS
                  <br /> <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="success"
                    size="large"
                    onClick={bikeToggleHandler}
                  >
                    Change To Bike
                  </MDButton>
                </MDBox>
              </Grid>

              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={5}
                >
                  <Stack>
                    <MDInput
                      type="search"
                      label="HotSpot"
                      size="large"
                      value={preBusSpot}
                      onChange={(e) => {
                        setPreBusSpot(e.target.value);
                      }}
                    />
                  </Stack>
                  <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="secondary"
                    size="medium"
                    onClick={() => {
                      if (preBusSpot.length === 0) {
                        alert("검색어를 입력 하세요!!!");
                        return;
                      }
                      loadBusSpotNameBySearch(preBusSpot);
                      setPreBusSpot("");
                    }}
                  >
                    SEARCH
                  </MDButton>
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  mb={1.5}
                  height={250}
                  bgColor="white"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={2}
                >
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="light"
                    size="small"
                    onClick={() => {
                      loadBusSpotName("관광 특구");
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
                      loadBusSpotName("고궁 문화유산");
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
                      loadBusSpotName("인구 밀집지역");
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
                      loadBusSpotName("발달 상권");
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
                      loadBusSpotName("공원");
                    }}
                  >
                    공원
                  </MDButton>
                </MDBox>
              </Grid>
            </Grid>
            <Grid container spacing={3}>
              <SpotList spots={busSpots} selectSpotHandler={selectBusSpotHandler} />
            </Grid>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={4}>
                <Card>
                  <MDBox display="flex" justifyContent="space-between" alignItems="center">
                    <BusKakaoMap
                      selectedBusSpot={selectedBusSpot}
                      busInfoStn={busInfoStn}
                      setBusStn={setBusStn}
                      busDisplay={busDisplay}
                      setSelectedBusSpot={setSelectedBusSpot}
                    />
                  </MDBox>
                </Card>
              </Grid>
              <Grid item xs={12} md={6} lg={8}>
                <Card>
                  <br />
                  <h5>정류장 정보 : {busStn}</h5>
                  <MDBox display="flex" justifyContent="space-between" alignItems="center" p={3}>
                    <BusInfo busInfo={busInfoDetail} busStn={busStn} />
                  </MDBox>
                </Card>
              </Grid>
            </Grid>
          </MDBox>
          <Footer />
        </DashboardLayout>
      </Stack>

      <Stack display={bikeDisplay}>
        <DashboardLayout>
          <DashboardNavbar />
          <MDBox py={3}>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="info"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={10}
                >
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="info"
                    size="large"
                    onClick={subwayToggleHandler}
                  >
                    Change To Subway
                  </MDButton>
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  color="white"
                  bgColor="success"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={10}
                >
                  Bike
                  <br /> <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="success"
                    size="large"
                    onClick={busToggleHandler}
                  >
                    Change To Bus
                  </MDButton>
                </MDBox>
              </Grid>

              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  height={250}
                  mb={1.5}
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={5}
                >
                  <Stack>
                    <MDInput
                      type="search"
                      label="HotSpot"
                      size="large"
                      value={preBikeSpot}
                      onChange={(e) => {
                        setPreBikeSpot(e.target.value);
                      }}
                    />
                  </Stack>
                  <br />
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="secondary"
                    size="medium"
                    onClick={() => {
                      if (preBikeSpot.length === 0) {
                        alert("검색어를 입력 하세요!!!");
                        return;
                      }
                      loadBikeSpotNameBySearch(preBikeSpot);
                      setPreBikeSpot("");
                    }}
                  >
                    SEARCH
                  </MDButton>
                </MDBox>
              </Grid>
              <Grid item xs={12} md={6} lg={3}>
                <MDBox
                  mb={1.5}
                  height={250}
                  bgColor="white"
                  variant="gradient"
                  borderRadius="lg"
                  shadow="lg"
                  opacity={1}
                  p={2}
                >
                  <MDButton
                    fullWidth
                    variant="gradient"
                    color="light"
                    size="small"
                    onClick={() => {
                      loadBikeSpotName("관광 특구");
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
                      loadBikeSpotName("고궁 문화유산");
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
                      loadBikeSpotName("인구 밀집지역");
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
                      loadBikeSpotName("발달 상권");
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
                      loadBikeSpotName("공원");
                    }}
                  >
                    공원
                  </MDButton>
                </MDBox>
              </Grid>
            </Grid>
            <Grid container spacing={3}>
              <SpotList spots={bikeSpots} selectSpotHandler={selectBikeSpotHandler} />
            </Grid>
            <Grid container spacing={3}>
              <Grid item xs={12} md={6} lg={7}>
                <Card>
                  <MDBox display="flex" justifyContent="space-between" alignItems="center">
                    <BikeKakaoMap
                      selectedBikeSpot={selectedBikeSpot}
                      bikeInfo={bikeInfo}
                      bikeDisplay={bikeDisplay}
                      setSelectedBikeSpot={setSelectedBikeSpot}
                    />
                  </MDBox>
                </Card>
              </Grid>
              <Grid item xs={12} md={6} lg={5}>
                <Card>
                  <MDBox display="flex" justifyContent="space-between" alignItems="center" p={5}>
                    <BikeInfo selectedBikeSpot={selectedBikeSpot} bikeInfo={bikeInfo} />
                  </MDBox>
                </Card>
              </Grid>
            </Grid>
          </MDBox>
          <Footer />
        </DashboardLayout>
      </Stack>
    </>
  );
}

export default Transport;
