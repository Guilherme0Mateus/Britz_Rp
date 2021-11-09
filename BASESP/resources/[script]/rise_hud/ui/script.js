var loadJS = function(url, implementationCode, location) {
	var scriptTag = document.createElement('script');
	scriptTag.src = url;

	scriptTag.onload = implementationCode;
	scriptTag.onreadystatechange = implementationCode;

	location.appendChild(scriptTag);
};

function ajaxio(method,url,type=null,data=null) {
	return new Promise((resolve, reject) => {
		const req = new XMLHttpRequest();
		req.open(method, url, true); 

		if (method == 'POST') {
			if (type == 'json' && data != null) {
				req.setRequestHeader('Content-Type', 'application/json');
				var data = JSON.stringify(data);
			}
			else { req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); }
		}

		req.onload = () => req.status === 200 ? resolve(req.response) : reject(Error(req.statusText));
		req.onerror = (e) => reject(Error(`Network Error: ${e}`));

		if (method == 'POST') { req.send(data); }
		else { req.send(); }
	});
}


Object.prototype.addMultiListener = function(eventNames, listener) {
	var events = eventNames.split(' ');

	if (NodeList.prototype.isPrototypeOf(this) == true) {
		for (var x=0, xLen=this.length; x<xLen; x++) {
			for (var i=0, iLen=events.length; i<iLen; i++) { this[x].addEventListener(events[i], listener, false); }
		}
	}

	else if (HTMLElement.prototype.isPrototypeOf(this) == true) {
		for (var i=0, iLen=events.length; i<iLen; i++) { this.addEventListener(events[i], listener, false); }
	}
}


window.onload = function () {

  var eventCallback = {
    hideHud: function(data) {
      if (data.value == true) $('.container').hide();
      if (data.value == false) $('.container').show();
    },
    ui: function(data) {
      let karalho = $('.karalho').text();
      $(".fill-shield").css('width', data.colete + '%'); 
      if (data.vida > 25.25) {
        $(".fill-heart").css('width', data.vida + '%');
        $(".karalho").text(data.vida);
      } else {
        $(".fill-heart").css('width', '0%');
        $(".karalho").text('0');
      }
    },
    toggleUi: function(data) {
      var uiID = document.querySelector('#ui');
      if (data.value == true) {
        uiID.style.display = 'block';
      }
      else {
        uiID.style.display = 'none';
      }
    },
    element: function(data) {
      if (data.task == 'enable') { document.querySelector('#'+data.value).style.display = 'block'; }
      else if (data.task == 'disable') { document.querySelector('#'+data.value).style.display = 'none'; }
    },
    setText: function(data) {
      var key = document.querySelector('#'+data.id);
      var html = data.value;
      saferInnerHTML(key, html);
    },
    updateWeapon: function(data) {
      var weaponContainer = document.querySelector('#weapon');
      if (data.status.armed == true) {

        var oldWeapon = document.querySelector('#weapon_image img').src;
        var newWeapon = 'assets/'+data.status.weapon+'.png';


        if (oldWeapon != newWeapon) {  document.querySelector('#weapon_image img').src = newWeapon; }
        if (weaponContainer.classList.contains('armed') == false) {
          weaponContainer.classList.remove('unarmed', 'fadeOut');
          weaponContainer.classList.add('armed', 'fadeIn');
        }
        
      }
      else {

        if (weaponContainer.classList.contains('unarmed') == false) {
          weaponContainer.classList.remove('armed', 'fadeIn');
          weaponContainer.classList.add('unarmed', 'fadeOut');
        }
        
      }
    },
    carUI: function(data) {

      // Show HUD when player enter a vehicle
      if(data.value == true){
        $('.xupeta').fadeIn();
        $('#kmh').text(data.speed);
      }
      
      // Fuel
      if(data.showfuel == true){
        $('#gasolina').text(parseInt(data.fuel));
        if(data.fuel <= 20){
          $('#gasolinatxt').style('color', 'rgb(146, 255, 113)');
        }
        if(data.fuel <= 10){
          $('#gasolinatxt').style('color', 'rgb(255, 164, 164)');
        }
      }

    },
  };
  window.addEventListener('message', function(event) {
    eventCallback[event.data.action](event.data);
  });
}



