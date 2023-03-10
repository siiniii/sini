/* eslint-disable prettier/prettier */
import { Stack } from "@mui/system";
import DataTable from "layouts/Tables/DataTable";
import { useEffect, useState } from "react";

/* eslint-disable react/prop-types */
function TrafficTable({ datas }) {
  const styleObj = {
    padding: "20px",
  };
  const fontSt = {
    fontWeight: "bold",
  };
  const [stts, setStts] = useState([{ RoadNM: "", Spd: "", Idx:"" }]);

  useEffect(() => {
    if (datas.length !== 0 ) {
      const newStts = [];
      datas.map((data) =>
        newStts.push({
          RoadNM: `${data.ROAD_NM}: [도로 시작명]${data.START_ND_NM}[도로 종료명] ${data.END_ND_NM}`,
          Spd: data.SPD,
          Idx: data.IDX,
        })
      );
      setStts(newStts);
      }
  },[datas]);

  // const a = { display: "flex", borderRadius: "15px", boxShadow: "2px 2px 7px", border: "none" };
  return (
    <DataTable
      canSearch
      table={{
        columns: [
          { Header: "RoadNM - Start - End", accessor: "RoadNM", width: "50%" },
          { Header: "Spd", accessor: "Spd", width: "25%" },
          { Header: "Idx", accessor: "Idx", width: "25%" },
        ],
        rows: stts,
      }}
    />

    // <div>
    //   <table display="flex" border="1px solid black">
    //     <thead>
    //       <tr textalign="center" width="200px">
    //         <th style={styleObj}>구간명</th>
    //         <th style={styleObj}>평균속도</th>
    //         <th style={styleObj}>상태</th>
    //       </tr>
    //     </thead>
    //     <tbody>
    //       {datas.map((data) => (
    //         <tr>
    //           <td style={styleObj}>
    //             <span style={fontSt}>{data.ROAD_NM}</span> <br /> {data.START_ND_NM}
    //             {data.END_ND_NM}
    //           </td>
    //           <td style={styleObj}>{data.SPD}</td>
    //           <td style={styleObj}>{data.IDX}</td>
    //         </tr>
    //       ))}
    //     </tbody>
    //     <tfoot />
    //   </table>
    // </div>
  );
}

export default TrafficTable;
