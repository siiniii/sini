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
import { useEffect, useState } from "react";
import axios from "axios";
import { Stack } from "@mui/system";
import NewsList from "./components/NewsList";
import NewsPaging from "./components/NewsPaging";
import NewsSearch from "./components/NewsSearch";
import NewsTitle from "./components/NewsTitle";

function News() {
  const [articles, setArticles] = useState([1]);
  const [startNum, setStartNum] = useState(1);
  const [preQuery, setPreQuery] = useState("");
  const [query, setQuery] = useState("서울");

  useEffect(() => {
    const loadNews = async () => {
      const response = await axios.get(
        `/react-team3/news/load-news?start=${startNum}&query=${query}`
      );
      // const response = await axios.get(`/react-team3/news?start=${startNum}&query=${query}`);
      setArticles(response.data);
    };
    loadNews();
  }, [startNum, query]);
  const [active, setActive] = useState([
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ]);
  const [page, setPage] = useState(1);
  const pageHandler = (e) => {
    switch (e) {
      case 1:
        setActive([true, false, false, false, false, false, false, false, false, false]);
        setStartNum(1);
        setPage(1);
        break;
      case 2:
        setActive([false, true, false, false, false, false, false, false, false, false]);
        setStartNum(11);
        setPage(2);
        break;
      case 3:
        setActive([false, false, true, false, false, false, false, false, false, false]);
        setStartNum(21);
        setPage(3);
        break;
      case 4:
        setActive([false, false, false, true, false, false, false, false, false, false]);
        setStartNum(31);
        setPage(4);
        break;
      case 5:
        setActive([false, false, false, false, true, false, false, false, false, false]);
        setStartNum(41);
        setPage(5);
        break;
      case 6:
        setActive([false, false, false, false, false, true, false, false, false, false]);
        setStartNum(51);
        setPage(6);
        break;
      case 7:
        setActive([false, false, false, false, false, false, true, false, false, false]);
        setStartNum(61);
        setPage(7);
        break;
      case 8:
        setActive([false, false, false, false, false, false, false, true, false, false]);
        setStartNum(71);
        setPage(8);
        break;
      case 9:
        setActive([false, false, false, false, false, false, false, false, true, false]);
        setStartNum(81);
        setPage(9);
        break;
      case 10:
        setActive([false, false, false, false, false, false, false, false, false, true]);
        setStartNum(91);
        setPage(10);
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
      case 6:
        pageHandler(5);
        break;
      case 7:
        pageHandler(6);
        break;
      case 8:
        pageHandler(7);
        break;
      case 9:
        pageHandler(8);
        break;
      case 10:
        pageHandler(9);
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
      case 6:
        pageHandler(7);
        break;
      case 7:
        pageHandler(8);
        break;
      case 8:
        pageHandler(9);
        break;
      case 9:
        pageHandler(10);
        break;

      default:
        break;
    }
  };
  const searchChange = (e) => {
    setPreQuery(e.target.value);
  };
  // eslint-disable-next-line consistent-return
  const searchHandler = () => {
    if (preQuery.length === 0) {
      // eslint-disable-next-line no-alert
      alert("검색어를 입력 하세요!!!");
      return;
    }
    setQuery(preQuery);
    pageHandler(1);
    setPreQuery("");
  };
  const aboutSeoul = () => {
    if (query === "서울") {
      return;
    }
    setQuery("서울");
    pageHandler(1);
  };

  return (
    <DashboardLayout>
      <DashboardNavbar />
      <MDBox py={3}>
        <Grid container spacing={3}>
          <NewsTitle query={query} />
        </Grid>
        <Grid container spacing={3} alignContent="center">
          <Grid item xs={12} lg={8}>
            <Card>
              <MDBox p={4} alignContent="center">
                <Stack display="flex" alignItems="center">
                  <NewsPaging
                    active={active}
                    pageHandler={pageHandler}
                    prevHandler={prevHandler}
                    nextHandler={nextHandler}
                  />
                </Stack>
              </MDBox>
              <MDBox display="flex" p={1}>
                <NewsList articles={articles} />
              </MDBox>
              <MDBox mt={1} p={4} alignContent="center">
                <Stack display="flex" alignItems="center">
                  <NewsPaging
                    active={active}
                    pageHandler={pageHandler}
                    prevHandler={prevHandler}
                    nextHandler={nextHandler}
                  />
                </Stack>
              </MDBox>
            </Card>
          </Grid>
          <Grid item xs={12} md={6} lg={4}>
            <NewsSearch
              searchChange={searchChange}
              searchHandler={searchHandler}
              preQuery={preQuery}
              aboutSeoul={aboutSeoul}
            />
          </Grid>
        </Grid>
      </MDBox>
      <Footer />
    </DashboardLayout>
  );
}

export default News;
