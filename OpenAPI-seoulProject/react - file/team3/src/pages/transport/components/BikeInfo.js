/* eslint-disable react/prop-types */
/* global kakao */
import { Stack } from "@mui/system";
import DataTable from "layouts/Tables/DataTable";
import React, { useEffect, useState } from "react";

function BikeInfo({ selectedBikeSpot, bikeInfo }) {
  const [row, setRow] = useState([{ Office: "", Rental: "" }]);

  useEffect(() => {
    if (bikeInfo.length !== 0 && selectedBikeSpot.length !== 0) {
      const newRow = [];
      bikeInfo.map((info) =>
        newRow.push({
          Office: info.SBIKE_SPOT_NM,
          Rental: info.SBIKE_PARKING_CNT,
        })
      );
      setRow(newRow);
    } else {
      setRow([{ Office: "", Rental: "" }]);
    }
  }, [bikeInfo]);

  return (
    <DataTable
      canSearch
      table={{
        columns: [
          { Header: "Office", accessor: "Office", width: "50%" },
          { Header: "Rental", accessor: "Rental", width: "50%" },
        ],
        rows: row,
      }}
    />
  );
}

export default BikeInfo;
