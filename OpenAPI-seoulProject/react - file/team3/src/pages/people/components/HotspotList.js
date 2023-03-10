/* eslint-disable prettier/prettier */
/* eslint-disable react/prop-types */
import NewsList from "pages/news/components/NewsList";
import styled from "styled-components";
import HotspotItem from "./HotspotItem";

const HotspotListBlock = styled.div`
  box-sizing: border-box;
  padding-bottom: 3rem;
  width: auto;
  margin: 0 auto;
  margin-top: 2rem;
  @media screen and (max-width: 768px) {
    width: 100%;
    padding-left: 1rem;
    padding-right: 1rem;
  }
`;

function HotspotList({ hotspots, setSpot, setSpotId }) {
  const isLast = true;
  const key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  return (
    <HotspotListBlock>
      { 
        hotspots.map((spot, idx) => 
          idx !== 9 ? (
            <HotspotItem key={key[idx]} spot={spot} last={false} setSpot={setSpot} setSpotId={setSpotId}/>
          ) : (
            <HotspotItem key={key[idx]} spot={spot} last={isLast} setSpot={setSpot} setSpotId={setSpotId}/>
            )
          )
      }
    </HotspotListBlock>
  );
}

export default HotspotList;
