import { Stack } from "@mui/system";
import DataTable from "layouts/Tables/DataTable";
import { useEffect, useState } from "react";

/* eslint-disable react/prop-types */
function CctvTable({ datas, setUrl }) {
  const [stts, setStts] = useState([]);

  useEffect(() => {
    if (datas.length !== 0) {
      const newStts = [];
      datas.map((data) =>
        newStts.push({
          RoadNM: data.cctvname,
          Url: (
            <button
              type="button"
              onClick={() => {
                setUrl(`${data.cctvurl}.m3u8`);
              }}
            >
              실시간 CCTV 보기
            </button>
          ),
        })
      );
      setStts(newStts);
    }
  }, [datas]);

  return (
    <DataTable
      canSearch
      table={{
        columns: [
          { Header: "RoadNM", accessor: "RoadNM", width: "70%" },
          { Header: "Url", accessor: "Url", width: "30%" },
        ],
        rows: stts,
      }}
    />
  );
}

export default CctvTable;
