/* eslint-disable react/prop-types */
/* global kakao */
import { Stack } from "@mui/system";
import DataTable from "layouts/Tables/DataTable";
import React, { useCallback, useEffect, useState } from "react";

function BusInfo({ busInfo, busStn }) {
  const [row, setRow] = useState([{ Bus: "", Route: "", Arvl1: "", Arvl2: "" }]);

  useEffect(() => {
    if (busInfo.length !== 0 && busStn.length !== 0) {
      const newRow = [];
      busInfo.map((info) =>
        newRow.push({
          Bus: info.RTE_NM,
          Route: info.RTE_SECT,
          Arvl1: info.RTE_ARRV_TM_1,
          Arvl2: info.RTE_ARRV_TM_2,
        })
      );
      setRow(newRow);
    } else if (busInfo.length === 0 && busStn.length !== 0) {
      alert("해당 지역은 도착 정보가 없습니다");
      const newRow = [{ Bus: "", Route: "", Arvl1: "", Arvl2: "" }];
      setRow(newRow);
    } else {
      const newRow = [{ Bus: "", Route: "", Arvl1: "", Arvl2: "" }];
      setRow(newRow);
    }
  }, [busInfo]);

  return (
    <DataTable
      canSearch
      table={{
        columns: [
          { Header: "Bus", accessor: "Bus", width: "25%" },
          { Header: "Route", accessor: "Route", width: "25%" },
          { Header: "Arvl1", accessor: "Arvl1", width: "25%" },
          { Header: "Arvl2", accessor: "Arvl2", width: "25%" },
        ],
        rows: row,
      }}
    />
  );
}

export default BusInfo;
