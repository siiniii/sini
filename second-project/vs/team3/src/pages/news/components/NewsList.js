/* eslint-disable react/prop-types */
import styled from "styled-components";
import NewsItem from "./NewsItem";

const NewsListBlock = styled.div`
  box-sizing: border-box;
  padding-bottom: 3rem;
  width: 768px;
  margin: 0 auto;
  margin-top: 2rem;
  @media screen and (max-width: 768px) {
    width: 100%;
    padding-left: 1rem;
    padding-right: 1rem;
  }
`;

function NewsList({ articles }) {
  const isLast = true;
  const key = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  return (
    <NewsListBlock>
      {articles.length !== 0 ? (
        articles.map((article, idx) =>
          idx !== 9 ? (
            <NewsItem key={key[idx]} article={article} last={false} />
          ) : (
            <NewsItem key={key[idx]} article={article} last={isLast} />
          )
        )
      ) : (
        <h1> 검색 결과가 없습니다 </h1>
      )}
    </NewsListBlock>
  );
}

export default NewsList;
