var limite;
var itensInv = [];
var itensPorta = [];


$(document).ready(function() {
    window.addEventListener("message", function(event) {
        switch (event.data.action) {
            case "showMenu":

                $('#itens').html(''); //LIMPAR SLOTS ANTES DE CRIAR
                $('#itensbau').html(''); //LIMPAR SLOTS ANTES DE CRIAR
                updateMochila();
                $("#actionmenu").fadeIn(500);
                $("#passaporte span").html(' ' + event.data.idade);
                $("#name b").html( event.data.sobrenome + ' ' + event.data.id);
                $("#registro span").html(event.data.identidade);
                $("#multas span").html(event.data.multas);
                $("#telefone span").html(event.data.telefone);
                $("#paypal span").html(event.data.registro);
                $("#emprego span").html(event.data.profissao);
                $("#carteira span").html(event.data.carteira);
                $("#banco span").html(event.data.banco);
                $("#paypal span").html(event.data.paypal);
                $("#vip span").html(event.data.vip);
                modalQt = 0;
                break;

            case "hideMenu":
                $("#actionmenu").fadeOut(500);
                break;

            case "updateMochila":
                updateMochila();
                break;
        }
    });
    $('#fechar').click(() => {
        $.post("http://insane_inventory/invClose");
        $('#quantidade').hide();
        $('#cursor').hide();

    });
    document.onkeyup = function(data) {
        if(data.which == 27) {
            $.post("http://insane_inventory/invClose");
            $('#quantidade').hide();

        }
    };
});

const updateDrag = () => {
    var modalQt = 0;
    $('#confirm').off();
    $('#praMenos').click(() => {
        if(modalQt >= 1) {
            modalQt = modalQt - 1;
            $('#placeQt').val(modalQt);
        }
    });
    $('#praMais').click(() => {
        modalQt = modalQt + 1;

        $('#placeQt').val(modalQt);
    });

    $('.item').draggable({
        helper: 'clone',
        appendTo: 'body',
        zIndex: 99999,
        revert: 'invalid',
        opacity: 0.7,
        start: function(event, ui) {
            $(this).children().children('img').hide();
            itemData = {
                key: $(this).data('item-key'),
                type: $(this).data('item-type')
            };
            if(itemData.key === undefined || itemData.type === undefined) return;

            $('.nomeItem').hide();
            $('#botoes').show();

            let $el = $(this);
            $el.addClass("active");
        },
        stop: function() {
            $('#botoes').hide();
            $(this).children().children('img').show();

            let $el = $(this);
            $el.removeClass("active");

        }
    })

    $('.usar').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {

            $('.item').animate({
                top: "0px",
                left: "0px"
            });
            itemData = {
                key: ui.draggable.data('item-key'),
                type: ui.draggable.data('item-type')
            };

            if(itemData.key === undefined || itemData.type === undefined) return;

            $('#quantidade').show();
            $('#placeQt').val(modalQt);
            $('#msgTeste').html('USAR');
            $('#confirm').click(() => {
                $.post("http://insane_inventory/useItem", JSON.stringify({
                    item: itemData.key,
                    type: itemData.type,
                    amount: Number($("#placeQt").val())

                }))
                $('#quantidade').hide();

            });

            $('#fecharModal').click(() => {
                $('#quantidade').hide();
            });
        }
    })

    $('.dropar').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {

            $('.item').animate({
                top: "0px",
                left: "0px"
            });
            itemData = {
                key: ui.draggable.data('item-key')
            };

            if(itemData.key === undefined) return;
            $('#msgTeste').html('DROPAR');
            $('#quantidade').show();
            $('#placeQt').val(modalQt);
            $('#confirm').click(() => {
                $.post("http://insane_inventory/dropItem", JSON.stringify({
                    item: itemData.key,
                    amount: Number($("#placeQt").val())
                }))

                $('#quantidade').hide();
            });

            $('#fecharModal').click(() => {
                $('#quantidade').hide();
            });


        }
    })

    $('.enviar').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {

            $('.item').animate({
                top: "0px",
                left: "0px"
            });
            itemData = {
                key: ui.draggable.data('item-key')
            };

            if(itemData.key === undefined) return;
            $('#msgTeste').html('ENVIAR');

            $('#quantidade').show();
            $('#placeQt').val(modalQt);
            $('#confirm').click(() => {

                $.post("http://insane_inventory/sendItem", JSON.stringify({
                    item: itemData.key,
                    amount: Number($("#placeQt").val())

                }))

                $('#quantidade').hide();

            });

            $('#fecharModal').click(() => {
                $('#quantidade').hide();
            });

        }
    })


    $('#itens').droppable({
        hoverClass: 'hoverControl',
        accept: '.itemBau',
        drop: function(event, ui) {
            itemData = {
                key: ui.draggable.data('item-key')
            };
            if(itemData.key === undefined) return;

            $('#quantidade').show();
            $('#placeQt').val(modalQt);
            $('#msgTeste').html('RETIRAR');
            $('#confirm').click(() => {
                $.post("http://insane_inventory/sendItem", JSON.stringify({
                    item: itemData.key,
                    amount: Number($("#placeQt").val())
                }))
                updateMochila();
                $('#quantidade').hide();

            });
        }
    })
    $('#itensbau').droppable({
        hoverClass: 'hoverControl',
        accept: '.itemInv',
        drop: function(event, ui) {
            console.log('teste');
            itemData = {
                key: ui.draggable.data('item-key')
            };
            if(itemData.key === undefined) return;

            $('#quantidade').show();
            $('#placeQt').val(modalQt);
            $('#msgTeste').html('GUARDAR');
            $('#confirm').click(() => {
                $.post("http://insane_inventory/storeItem", JSON.stringify({
                    item: itemData.key,
                    amount: Number($("#placeQt").val())
                }))
                updateMochila();
                $('#quantidade').hide();

            });
        }
    })
}

const formatarNumero = (n) => {
    var n = n.toString();
    var r = '';
    var x = 0;

    for(var i = n.length; i > 0; i--) {
        r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
        x = x == 2 ? 0 : x + 1;
    }

    return r.split('').reverse().join('');
}

const updateMochila = () => {
    $.post("http://insane_inventory/requestMochila", JSON.stringify({}), (data) => {

        itensInv = data.inventario;
        itensPorta = data.inventario2;
        $('#itens').html(''); //LIMPAR SLOTS ANTES DE CRIAR
        $('#itensbau').html(''); //LIMPAR SLOTS ANTES DE CRIAR
        $('#possui').html((data.peso).toFixed(2));
        $('#total').html((data.maxpeso).toFixed(2) + 'kg');

        if(data.veiculo) {
            $('#identidade').hide();
            $('#bau').show();
			$('#bau').css('height', '630px');
            $('#nomeCarro b').html(data.veiculo);
            $('#possui2').html((data.peso2).toFixed(2));
            $('#total2').html((data.maxpeso2).toFixed(2) + 'kg');
        } else {
			$('#identidade').css('height', '630px');
            $('#identidade').show();
            $('#bau').hide();
			$('.itemRG').css('margin-top', '40px');
			$('#paypal').css('display', 'block');
			$('#vip').css('display', 'block');
        }

        if(data.maxpeso <= 6){
			$('#peso span').css('width',data.peso/0.06+'%');
		  }else if(data.maxpeso <= 51){
			$('#peso span').css('width',data.peso/0.51+'%');
		  }else if(data.maxpeso <= 75){
			$('#peso span').css('width',data.peso/0.05+'%');
		  }else if(data.maxpeso <= 90){
			$('#peso span').css('width',data.peso/0.05+'%');
          }

          if(data.maxpeso2 <= 10){
			$('#pesoBau span').css('width',data.peso2/0.1+'%');
		  }else if(data.maxpeso2 <= 15){
			$('#pesoBau span').css('width',data.peso2/0.15+'%');
		  }else if(data.maxpeso2 <= 20){
			$('#pesoBau span').css('width',data.peso2/0.2+'%');
		  }else if(data.maxpeso2 <= 25){
			$('#pesoBau span').css('width',data.peso2/0.25+'%');
          }else if(data.maxpeso2 <= 30){
			$('#pesoBau span').css('width',data.peso2/0.3+'%');
          }else if(data.maxpeso2 <= 35){
			$('#pesoBau span').css('width',data.peso2/0.35+'%');
          }else if(data.maxpeso2 <= 40){
			$('#pesoBau span').css('width',data.peso2/0.4+'%');
          }else if(data.maxpeso2 <= 45){
			$('#pesoBau span').css('width',data.peso2/0.45+'%');
          }else if(data.maxpeso2 <= 50){
			$('#pesoBau span').css('width',data.peso2/0.5+'%');
          }else if(data.maxpeso2 <= 55){
			$('#pesoBau span').css('width',data.peso2/0.55+'%');
          }else if(data.maxpeso2 <= 60){
			$('#pesoBau span').css('width',data.peso2/0.6+'%');
          }else if(data.maxpeso2 <= 65){
			$('#pesoBau span').css('width',data.peso2/0.65+'%');
          }else if(data.maxpeso2 <= 70){
			$('#pesoBau span').css('width',data.peso2/0.7+'%');
          }else if(data.maxpeso2 <= 75){
			$('#pesoBau span').css('width',data.peso2/0.75+'%');
          }else if(data.maxpeso2 <= 80){
			$('#pesoBau span').css('width',data.peso2/0.8+'%');
          }else if(data.maxpeso2 <= 85){
			$('#pesoBau span').css('width',data.peso2/0.85+'%');
          }else if(data.maxpeso2 <= 90){
			$('#pesoBau span').css('width',data.peso2/0.9+'%');
          }else if(data.maxpeso2 <= 95){
			$('#pesoBau span').css('width',data.peso2/0.95+'%');
          }else if(data.maxpeso2 <= 100){
			$('#pesoBau span').css('width',data.peso2+'%');
          }else if(data.maxpeso2 <= 150){
			$('#pesoBau span').css('width',data.peso2/1.5+'%');
          }else if(data.maxpeso2 <= 400){
			$('#pesoBau span').css('width',data.peso2/4+'%');
          }
          

        for(let i = 0; i < itensInv.length; i++) { // SETANDO OS SLOTS
            $('#itens').append(`
			<div id="item${i}" class="item itemInv"  style="background-image: url('images/${itensInv[i].index}.png'); background-size: 80% 80%; background-position: center;"  data-item-key="${itensInv[i].key}" data-item-type="${itensInv[i].type}" data-name-key="${itensInv[i].name}" class="item"></div>
			`);
            for(let f = 0; f < itensInv.length; f++) {
                $('#item' + f).html(`
					<div id="qtItem">x${formatarNumero(itensInv[f].amount)}</div>
					<div id="nomeItem${f}" class="nomeItem" style="display: none;"><z>${itensInv[f].name}</z></div>
            	`);
                $('#item' + f).hover(() => {
                    $('#hover' + f).show();
                    $('#nomeItem' + f).show();
                });
                $('#item' + f).mouseleave(() => {
                    $('#nomeItem' + f).hide();
                    $('#hover' + f).hide();
                });
            }
        }
       
        updateDrag();
    });
}
$('#cancel').click(() => {
    $('#quantidade').hide();
});

$('#personagem').click(() => {
    $('#parte2, #parte3').show();
    $('#parte6').hide();
    $('#criacao').css('color', '#fff');
    $('#criacao').removeClass('selected');
    $('#personagem').addClass('selected');
    $('#personagem').css('color', '#000');
});