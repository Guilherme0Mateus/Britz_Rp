$(document).ready(function(){
	let actionContainer = $("#actionmenu");

	window.addEventListener('message',function(event){
		let item = event.data;
		switch(item.action){
			case 'showMenu':
				updateGarages();
				actionContainer.fadeIn(1000);
			break;

			case 'hideMenu':
				actionContainer.fadeOut(1000);
			break;

			case 'updateGarages':
				updateGarages();
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			sendData("ButtonClick","exit")
			$('#data-top').fadeOut();
		}
	};
});

const formatarNumero = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}
	return r.split('').reverse().join('');
}

const sendData = (name,data) => {
	$.post("http://vrp_garages/"+name,JSON.stringify(data),function(datab){});
}

const updateGarages = () => {
		$.post('http://vrp_garages/myVehicles',JSON.stringify({}),(data) => {
			const nameList = data.vehicles.sort((a,b) => (a.name2 > b.name2) ? 1: -1);
			
			$('#inferior-part').html(`
				
				${nameList.map((item) => (`
	
				<div class="item" data-typecar='${item.type}' data-status='${item.status}' data-ipva='${item.ipva}' data-name="${item.name}" data-item-name="${item.name}" data-name2="${item.name2}" data-engine="${item.engine}" data-body="${item.body}" data-fuel="${item.fuel}">
					<div id="name-car">
						<a>${item.name}</a>
					</div>
					<div id="backgrounded-car" style="background-image: url('https://wolkesoft.com/fcp/powerserver/teste/${item.name}.png');"></div>
				</div>

				`)).join('')}
			`);
			var vehicles = document.getElementsByClassName(".item")
			$("#nomeCarro").text($(vehicles[0]).data("name2"))
			$("#seguro span").text($(vehicles[0]).data("status"))
			$("#ipva").text($(vehicles[0]).data("ipva"))
			$("#engine").text(`${$(vehicles[0]).data("engine")}%`)
			$("#latariapercent").text(`${$(vehicles[0]).data("body")}%`)
			$("#fuel").text(`${$(vehicles[0]).data("fuel")}%`)
			$("#mostraFoto").css("background-image",`url(http://wolkesoft.com/fcp/powerserver/teste/${$(vehicles[0]).data("name")}.png)`)
			$(vehicles[0]).addClass("active")
	});
}

$(document).on('click','.item',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	if (isActive) return;
	$('.item').removeClass('active');
	if(!isActive) $el.addClass('active');
    $('#data-top').fadeIn();
    

    $("#name-princi-car").text($(this).data("name2"))
    $("#status").text("$" + $(this).data("status"))
    $("#ipva").text($(this).data("ipva"))
    $("#motor").text(`${$(this).data("engine")}%`)
    $(".div-motor").css(`width`, `${$(this).data("engine")}px`)
    $("#lataria").text(`${$(this).data("body")}%`)
    $(".div-metal").css(`width`, `${$(this).data("body")}px`)
    $("#fuel").text(`${$(this).data("fuel")}%`)
    $(".div-fuel").css(`width`, `${$(this).data("fuel")}px`)
	$("#car-selected").fadeOut(0).delay(400).css("background-image",`url(https://wolkesoft.com/fcp/powerserver/teste/${$(this).data("name")}.png)`).fadeIn(400);

});

$(document).on('click','.retirar',function(){
	let $el = $('.item.active');
	if($el) {
		$.post('http://vrp_garages/spawnVehicles',JSON.stringify({
			name: $el.attr('data-item-name')
		}));
	}
})

$(document).on('click','.guardar',function(){
	$.post('http://vrp_garages/deleteVehicles',JSON.stringify({}));
})
