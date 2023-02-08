import { ReactComponent as Map } from "pages/transport/data/mapimage.svg";
import { useEffect } from "react";
import styled from "styled-components";

const LineMapCSS = styled.div`
  @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");
  .mapImage {
    transform-origin: top left;
    transition: transform 0.3s;
  }
`;
function LineMap() {
  let $zoom = 1;

  function mapZoom() {
    document.querySelector(".mapImage").style.transform = `scale(${$zoom})`;
  }

  // eslint-disable-next-line no-restricted-globals
  addEventListener("keydown", (event) => {
    if (event.key === "+") {
      $zoom += 0.2;
    } else if (event.key === "=") {
      $zoom += 0.2;
    } else if (event.key === "-") {
      $zoom -= 0.2;
    } else if (event.key === "_") {
      $zoom -= 0.2;
    }

    mapZoom();
  });

  useEffect(() => {
    // eslint-disable-next-line no-alert
    alert("+/- 키를 누르시면 노선도를 확대 축소하실 수 있습니다.");
  }, []);

  return (
    <LineMapCSS>
      <Map className="mapImage" />
    </LineMapCSS>
  );
}

export default LineMap;
