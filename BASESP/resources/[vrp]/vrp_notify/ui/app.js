$(document).ready(function () {
	window.addEventListener("message", function (event) {
		iziToast.show({
			id: 'haduken',
			class: 'pingo',
			theme: 'dark',
			title: 'Notificação',
			displayMode: 0,
			close: false,
			balloon: false,
			backgroundColor: 'rgba(0,0,0,0.50)',
			message: event.data.mensagem,
			position: 'topCenter',
			transitionIn: 'flipInX',
			transitionOut: 'flipOutX',
			progressBarColor: 'rgba(22, 222, 208, 184)',
			imageWidth: 70,
			layout: 2,
			iconColor: 'rgb(0, 255, 184)'
		});
	})
});