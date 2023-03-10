/* eslint-disable no-param-reassign */
import TimelineItem from "layouts/Timeline/TimelineItem";
import TimelineList from "layouts/Timeline/TimelineList";
import styled from "styled-components";

/* eslint-disable react/prop-types */
const { Icon, Card } = require("@mui/material");
// icon={<Icon fontSize="small">email</Icon>}

const Peopletable = styled.div`
  box-sizing: border-box;
  padding-bottom: 3rem;
  width: auto;
  height: 300px;
  margin: 0 auto;
  @media screen and (max-width: 768px) {
    width: 100%;
    padding-left: 1rem;
    padding-right: 1rem;
  }
`;

function PeopleTable({ data, spot }) {
  if (data.length === 0) {
    return <TimelineList title="실시간 인구 혼잡도 (장소를 선택하세요)" />;
  }

  return (
    <Peopletable>
      <TimelineList title="실시간 인구 혼잡도">
        <TimelineItem
          py={30}
          color="success"
          icon="notifications"
          title="인구혼잡도"
          dateTime={spot}
          description={data.AREA_CONGEST_MSG}
          badges={["design"]}
        />
      </TimelineList>
    </Peopletable>
  );
}

export default PeopleTable;
