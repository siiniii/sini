/* eslint-disable react/prop-types */
/* global kakao */
import { Stack } from "@mui/system";
import React, { useEffect, useState } from "react";

const { kakao } = window;

function BusKakaoMap({ selectedBusSpot, busInfoStn, setBusStn, busDisplay, setSelectedBusSpot }) {
  function makeOverListener(map, marker, infowindow, infowindows, stn) {
    return function () {
      // eslint-disable-next-line no-plusplus
      for (let idx = 0; idx < infowindows.length; idx++) {
        infowindows[idx].close();
      }
      setBusStn(stn);
      infowindow.open(map, marker);
    };
  }

  useEffect(() => {
    if (busInfoStn.length !== 0) {
      const container = document.getElementById("busMap");

      const options = {
        center: new window.kakao.maps.LatLng(busInfoStn[0].BUS_STN_Y, busInfoStn[0].BUS_STN_X),
        level: 5,
      };

      const map = new window.kakao.maps.Map(container, options);

      const position = busInfoStn.map(
        (info, idx) => new kakao.maps.LatLng(info.BUS_STN_Y, info.BUS_STN_X)
      );
      const iwContent = busInfoStn.map(
        (info, idx) => `<div style="
      width: max-content;
  "><h5>${info.BUS_STN_NM}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5></div>`
      );
      const stn = [];

      busInfoStn.map((info) => stn.push(info.BUS_STN_NM));

      const infowindows = [];
      const markers = [];
      // eslint-disable-next-line no-plusplus
      for (let i = 0; i < position.length; i++) {
        const marker = new kakao.maps.Marker({
          map,
          position: position[i],
        });
        const infowindow = new kakao.maps.InfoWindow({
          content: iwContent[i],
          removable: true,
        });
        infowindows.push(infowindow);
        markers.push(marker);
      }

      // eslint-disable-next-line no-plusplus
      for (let i = 0; i < position.length; i++) {
        kakao.maps.event.addListener(
          markers[i],
          "click",
          makeOverListener(map, markers[i], infowindows[i], infowindows, stn[i])
        );
      }
    } else if (selectedBusSpot.length !== 0 && busInfoStn === 0) {
      alert("해당 지역은 정류장 정보가 없습니다");
      setSelectedBusSpot("");
    } else {
      const container = document.getElementById("busMap");

      const options = {
        center: new window.kakao.maps.LatLng(37.5001513, 127.0290763),
        level: 5,
      };

      const map = new window.kakao.maps.Map(container, options);
    }
  }, [busInfoStn, busDisplay]);

  return (
    <div
      id="busMap"
      style={{
        width: "600px",
        height: "800px",
      }}
    />
  );
}

export default BusKakaoMap;
