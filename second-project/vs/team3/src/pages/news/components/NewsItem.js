/* eslint-disable react/prop-types */
import styled from "styled-components";

const NewsItemBlock = styled.div`
  display: flex;

  .thumbnail {
    margin-right: 5rem;
    img {
      display: block;
      width: 160px;
      height: 100px;
      object-fit: cover;
    }
  }
  .contents {
    h2 {
      margin: 0;
      a {
        color: #22b8cf;
      }
    }
    p {
      margin: 0;
      line-height: 1.5;
      margin-top: 0.5rem;
      margin-bottom: 2rem;
      white-space: normal;
    }
  }
  & + & {
    margin-top: 10rem;
  }
`;

function NewsItem({ article, last }) {
  const { link, title, desc } = article;

  return last === true ? (
    <NewsItemBlock>
      <div className="contents">
        <h2>
          <a href={link} target="_blank" rel="noreferrer">
            {title}
          </a>
        </h2>
        <p>{desc}</p>
      </div>
    </NewsItemBlock>
  ) : (
    <>
      <NewsItemBlock>
        <div className="contents">
          <h2>
            <a href={link} target="_blank" rel="noreferrer">
              {title}
            </a>
          </h2>
          <p>{desc}</p>
        </div>
      </NewsItemBlock>
      <hr />
      <br />
      <br />
    </>
  );
}

export default NewsItem;
