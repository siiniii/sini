/* eslint-disable react/prop-types */
import { Icon } from "@mui/material";
import { Stack } from "@mui/system";
import MDPagination from "components/MDPagination";

function NewsPaging({ pageHandler, prevHandler, nextHandler, active }) {
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
      <MDPagination
        item
        active={active[5]}
        onClick={(e) => {
          pageHandler(6);
        }}
      >
        6
      </MDPagination>
      <MDPagination
        item
        active={active[6]}
        onClick={(e) => {
          pageHandler(7);
        }}
      >
        7
      </MDPagination>
      <MDPagination
        item
        active={active[7]}
        onClick={(e) => {
          pageHandler(8);
        }}
      >
        8
      </MDPagination>
      <MDPagination
        item
        active={active[8]}
        onClick={(e) => {
          pageHandler(9);
        }}
      >
        9
      </MDPagination>
      <MDPagination
        item
        active={active[9]}
        onClick={(e) => {
          pageHandler(10);
        }}
      >
        10
      </MDPagination>
      <MDPagination item onClick={nextHandler}>
        <Icon>keyboard_arrow_right</Icon>
      </MDPagination>
    </MDPagination>
  );
}

export default NewsPaging;
