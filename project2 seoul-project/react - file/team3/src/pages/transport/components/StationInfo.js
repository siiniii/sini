/* eslint-disable react/prop-types */
import { DoDisturb } from "@mui/icons-material";
import { useEffect, useState } from "react";
import DataTable from "layouts/Tables/DataTable";

function StationInfo({ selectedStation, stationInfo }) {
  const [row, setRow] = useState([{ Line: "", Stn: "", UpDn: "", Dir: "", Msg: "", ReTm: "" }]);

  useEffect(() => {
    if (selectedStation.length !== 0 && stationInfo.length === 0) {
      // eslint-disable-next-line no-alert
      alert("열차 정보가 없습니다");
      setRow([{ Line: "", Stn: "", UpDn: "", Dir: "", Msg: "", ReTm: "" }]);
    } else {
      const newRow = [];
      stationInfo.map((info) =>
        newRow.push({
          Line: info.subwayId,
          Stn: info.statnNm,
          UpDn: info.updnLine,
          Dir: info.trainLineNm,
          Msg: info.arvlMsg2,
          ReTm: info.recptnDt,
        })
      );
      setRow(newRow);
    }
  }, [stationInfo]);

  return (
    <DataTable
      canSearch
      table={{
        columns: [
          { Header: "Line", accessor: "Line", width: "10%" },
          { Header: "Stn", accessor: "Stn", width: "20%" },
          { Header: "UpDn", accessor: "UpDn", width: "10%" },
          { Header: "Dir", accessor: "Dir", width: "20%" },
          { Header: "Msg", accessor: "Msg", width: "20%" },
          { Header: "ReTm", accessor: "ReTm", width: "20%" },
        ],
        rows: row,
      }}
    />
  );
}

export default StationInfo;
