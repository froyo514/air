

class Timer{
	interval;


	getToken(token, send, finished, timer) {
		const tk = String(Math.floor(Math.random()*1000000)).padStart(6, "0");
		token.text(tk);
		send.attr("style", "background-color: #ffffff; cursor: default;");
		send.attr("disabled", true);
		finished.attr("style", "background-color: #0068ff; color: #ffffff; cursor: pointer;");
		finished.attr("disabled", false);
		this.getTimerInterval(token, send, finished, timer);
	}
	
	getTimerIntervalConfirm(finished, signup) {
		clearInterval(this.interval)
		finished.attr("style", "background-color: #ffffff; cursor: default;");
		finished.attr("disabled", true);
		finished.text("인증완료");
		alert("인증이 완료되었습니다.");
		signup.attr("style", "background-color: #ffffff; color: #2c3639; border: 1px solid #2c3639; cursor: default;");
		signup.attr("disabled", false);
	}
	
	getTimerInterval(token, send, finished, timer) {
		let time = 179;
		this.interval = setInterval(() => {
			if(time >= 0) {
				const minutes = Math.floor(time/60);
				const seconds = time % 60;
				timer.text(minutes + ":" + String(seconds).padStart(2, "0"));
				time -= 1;
			} else {
				token.text("000000");
				send.attr("style", "");
				send.attr("disabled", true);
				timer.text("3:00");
				finished.attr("style", "");
				finished.attr("disabled", true);
				clearInterval(interval);
			}
		}, 1000);
	}
}
	

	
	
	
	