	$(function() {
	 
	 
	 
	// 카운트를 표시할 요소
	const $counter = document.querySelector(".donate-count");

	// 목표수치

	const donateSum = 85501500;
	
	counter($counter, donateSum);
	function counter($counter, donateSum) {
		let now = donateSum;

		const handle = setInterval(() => {
			$counter.innerHTML = Math.ceil(donateSum - now).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

			// 목표에 도달하면 정지
			if (now < 1) {
				clearInterval(handle);
			}

			// 적용될 수치, 점점 줄어듬
			const step = now / 30;

			now -= step;
		}, 7);
	}

});





