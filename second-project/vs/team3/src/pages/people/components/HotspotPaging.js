/* eslint-disable react/prop-types */
import { Icon } from "@mui/material";
import MDPagination from "components/MDPagination";

function HotspotPaging({ pageHandler, prevHandler, nextHandler, active }) {
  return (
    <MDPagination size="large" margin="auto">
      <MDPagination item onClick={prevHandler}>
        <Icon>keyboard_arrow_left</Icon>
      </MDPagination>
      <MDPagination
        item
        active={active[0]}
        onClick={(e) => {
          pageHandler(1);
        }}
      >
        1
      </MDPagination>
      <MDPagination
        item
        active={active[1]}
        onClick={(e) => {
          pageHandler(2);
        }}
      >
        2
      </MDPagination>
      <MDPagination
        item
        active={active[2]}
        onClick={(e) => {
          pageHandler(3);
        }}
      >
        3
      </MDPagination>
      <MDPagination
        item
        active={active[3]}
        onClick={(e) => {
          pageHandler(4);
        }}
      >
        4
      </MDPagination>
      <MDPagination
        item
        active={active[4]}
        onClick={(e) => {
          pageHandler(5);
        }}
      >
        5
      </MDPagination>
      <MDPagination item onClick={nextHandler}>
        <Icon>keyboard_arrow_right</Icon>
      </MDPagination>
    </MDPagination>
  );
}

export default HotspotPaging;
