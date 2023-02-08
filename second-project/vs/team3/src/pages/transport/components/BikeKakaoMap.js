/* eslint-disable react/prop-types */
/* global kakao */
import { Stack } from "@mui/system";
import React, { useEffect, useState } from "react";

const { kakao } = window;

function BikeKakaoMap({ selectedBikeSpot, bikeInfo, bikeDisplay, setSelectedBikeSpot }) {
  function makeOverListener(map, marker, infowindow, infowindows) {
    return function () {
      // eslint-disable-next-line no-plusplus
      for (let idx = 0; idx < infowindows.length; idx++) {
        infowindows[idx].close();
      }

      infowindow.open(map, marker);
    };
  }

  useEffect(() => {
    if (bikeInfo.length !== 0) {
      const container = document.getElementById("map");

      const options = {
        center: new window.kakao.maps.LatLng(bikeInfo[0].SBIKE_Y, bikeInfo[0].SBIKE_X),
        level: 5,
      };

      const map = new window.kakao.maps.Map(container, options);

      const position = bikeInfo.map(
        (info, idx) => new kakao.maps.LatLng(info.SBIKE_Y, info.SBIKE_X)
      );
      const iwContent = bikeInfo.map(
        (info, idx) => `<div style="
      width: max-content;
  "><h5>${info.SBIKE_SPOT_NM}(${info.SBIKE_PARKING_CNT})&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5></div>`
      );

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
          makeOverListener(map, markers[i], infowindows[i], infowindows)
        );
      }
    } else if (selectedBikeSpot.length !== 0) {
      alert("해당 지역은 대여소가 없습니다!");
      setSelectedBikeSpot("");
    } else {
      const container = document.getElementById("map");

      const options = {
        center: new window.kakao.maps.LatLng(37.5001513, 127.0290763),
        level: 5,
      };
      const map = new window.kakao.maps.Map(container, options);
    }
  }, [bikeInfo, bikeDisplay]);

  return (
    <div
      id="map"
      style={{
        width: "1000px",
        height: "800px",
      }}
    />
  );
}

export default BikeKakaoMap;
