	function up() {
		if (5 < UD) {
			UD -= 5 * Speed;
			$(".village_charac").css("top", UD + "px");
		}
		show_shop();
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function down() {
		if (UD < 905) {
			UD += 5 * Speed;
			$(".village_charac").css("top", UD + "px");
		}
		show_shop();
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function left() {
		if (10 < LR) {
			LR -= 5 * Speed;
			$(".village_charac").css("left", LR + "px");
		}
		show_shop();
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function right() {
		if (LR < 905) {
			LR += 5 * Speed;
			$(".village_charac").css("left", LR + "px");
		}
		show_shop();
		console.log("LR:" + LR + ", UD:" + UD);
	}
	
	function show_shop(){
		if (LR <= 350 && UD <=350){
			$(".shop_bg").removeClass("hidden");
		}else{
			$(".shop_bg").addClass("hidden");
		}
	}

	document.addEventListener("keydown", checkKey, false);

	function checkKey(e) {
		console.clear();
		if (e.keyCode === 37) {
			left();
		} else if (e.keyCode === 38) {
			up();
		} else if (e.keyCode === 39) {
			right();
		} else if (e.keyCode === 40) {
			down();
		}
	}