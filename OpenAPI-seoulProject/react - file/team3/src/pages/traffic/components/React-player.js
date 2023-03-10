/* eslint-disable react/prop-types */
import ReactPlayer from "react-player/lazy";

function CctvVideo({ url }) {
  return (
    <div className="player-wrapper">
      <ReactPlayer
        className="react-player"
        url={url} // 플레이어 url
        width="800px" // 플레이어 크기 (가로)
        height="500px" // 플레이어 크기 (세로)
        playing // 자동 재생 on
        muted // 자동 재생 on
        controls // 플레이어 컨트롤 노출 여부
        light={false} // 플레이어 모드
        pip // pip 모드 설정 여부
        poster="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg" // 플레이어 초기 포스터 사진
      />
    </div>
  );
}

export default CctvVideo;
