/* eslint-disable no-plusplus */
/* eslint-disable react/prop-types */
import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { useEffect, useState } from "react";

export default function WeatherTable({ datas }) {
  const [timeRow, setTimeRow] = useState([
    "시간",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
  ]);
  const [tempRow, setTempRow] = useState([
    "기온",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
  ]);
  const [rainChRow, setRainChRow] = useState([
    "강수확률",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
  ]);
  const [rainAmRow, setRainAmRow] = useState([
    "강수량",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
  ]);
  const [skyRow, setSkyRow] = useState([
    "날씨",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
  ]);

  useEffect(() => {
    if (datas.length !== 0) {
      const newTimeRow = ["시간"];
      const newTempRow = ["기온 °C"];
      const newRainChRow = ["강수형태"];
      const newRainAmRow = ["강수량(mm)"];
      const newSkyRow = ["날씨"];

      datas.map((data) => newTimeRow.push(data.TIME));

      datas.map((data) => newTempRow.push(data.TEMP));

      datas.map((data) => newRainChRow.push(data.PRECIPITATION));

      datas.map((data) => newRainAmRow.push(data.RAIN_CHANCE));

      datas.map((data) => newSkyRow.push(data.SKY_STTS));

      setTempRow(newTempRow);
      setRainChRow(newRainChRow);
      setRainAmRow(newRainAmRow);
      setTimeRow(newTimeRow);
      setSkyRow(newSkyRow);
    }
  }, [datas]);

  return (
    <TableContainer>
      <Table sx={{ minWidth: 650 }} size="small" aria-label="a dense table">
        <TableBody>
          <TableRow>
            {timeRow.map((time) => (
              <TableCell>{time}</TableCell>
            ))}
          </TableRow>
          <TableRow>
            {skyRow.map((sky) => (
              <TableCell>{sky}</TableCell>
            ))}
          </TableRow>
          <TableRow>
            {tempRow.map((temp) => (
              <TableCell>{temp}</TableCell>
            ))}
          </TableRow>
          <TableRow>
            {rainAmRow.map((amount) => (
              <TableCell>{amount}</TableCell>
            ))}
          </TableRow>
          <TableRow>
            {rainChRow.map((chance) => (
              <TableCell>{chance}</TableCell>
            ))}
          </TableRow>
        </TableBody>
      </Table>
    </TableContainer>
  );
}
