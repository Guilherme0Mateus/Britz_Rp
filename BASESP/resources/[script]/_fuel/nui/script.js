
var modalQt = 1;
var litros = 1;
var valor = 3;
var total = 1;
var combustivelAtual = 0;
var combustivelTotal = 100;

$(function(){

    // $('#valor').html('R$'+valor);
    // $('#proguess span').css('width', combustivelAtual + '%')
    // $('#atual').html(combustivelAtual);
    // $('#total').html(combustivelTotal);
    // $('#hover span').html(totalCompletar);
    // $('#qtGas').val((3).toFixed(1));
    
    var actionContainer = $("#actionmenu");
    
   actionContainer.hide();
    
	window.addEventListener('message',function(event){
		var item = event.data;

		if (item.showmenu){
            actionContainer.fadeIn(500);
            console.log(`${item.fuel} ${item.litro}`)
            combustivelAtual = item.fuel
            valor = item.litro
            totalCompletar = (100 - combustivelAtual) * valor
            $('#valor').html('R$'+valor);
            $('#proguess span').css('width', combustivelAtual + '%')
            $('#atual').html(Math.round(combustivelAtual));
            $('#total').html(combustivelTotal);
            $('#hover span').html(totalCompletar);

            $('#litros').val(1);
            $('#qtGas').val((valor).toFixed(1));
        
		} //* enviar fuel e litro

        if (item.update) {
            console.log(item.fuel)
            $('#proguess span').css('width', item.fuel + '%')
            $('#completar').prop('disabled', true);
            $('#abastecer').prop('disabled', true);
            $('#atual').html(Math.round(item.fuel));

        }
		if (item.hidemenu){
            actionContainer.fadeOut(1000);
            $('#completar').prop('disabled', false);
            $('#abastecer').prop('disabled', false);

		}
	});




document.onkeyup = function(data){
    if (data.which == 27){
        if (actionContainer.is(":visible")){
            $.post("http://_fuel/close", JSON.stringify({}));        
        }
    }
};

});


//EVENTOS DO BOTÃO
$('#mais').click(() => {
    if($('#litros').val() < (100-combustivelAtual)){

        modalQt = Number($('#qtGas').val());
            $('#qtGas').val((modalQt + valor).toFixed(1));
    
        modalQt = Number($('#qtGas').val());
    
        litros = modalQt / valor;
        $('#litros').val(litros);
    }
});

$('#menos').click(() => {
    modalQt = Number($('#qtGas').val());
    if(modalQt > valor) {
        $('#qtGas').val((modalQt - valor).toFixed(1));
    }

    modalQt = Number($('#qtGas').val());

    litros = modalQt / valor;
    $('#litros').val(litros);
});

$('#maisLitros').click(() => {
    modalLitros = Number($('#litros').val());
    if(modalLitros > 0) {
        $('#litros').val(modalLitros + 1)
    }


    total = Number($('#litros').val()) * valor;
    $('#qtGas').val((total.toFixed(1)));
});

$('#menosLitros').click(() => {
    modalLitros = Number($('#litros').val());
    if(modalLitros > 1) {
        $('#litros').val(modalLitros - 1)
    }


    total = Number($('#litros').val()) * valor;
    $('#qtGas').val((total.toFixed(1)));
});

$('#qtGas').keyup(function() {
    setTimeout(() => {

        if ((Number($('#qtGas').val()) % 3 > 0)){
            $('#qtGas').val((Number($('#qtGas').val()) - (Number($('#qtGas').val()) % 3)))
        }

        if ($('#qtGas').val() <= 0){
            $('#qtGas').val(valor);
        }
        
        modalQt = $('#qtGas').val();
        litros = modalQt / valor;
        total = modalQt * valor;

        $('#litros').val(litros);
    }, 500);
});

$('#litros').keyup(function() {
    setTimeout(() => {
        modalQt = $('#litros').val();
        total = modalQt * valor;
        $('#qtGas').val((total.toFixed(1)));
    }, 500);
});



$('#completar').hover(() => {
    $('#hover').show();
});
$('#completar').mouseleave(() => {
    $('#hover').hide();
});


$('#abastecer').click(() => {
    console.log("test")
    $.post("http://_fuel/abastecer", JSON.stringify({
        valor: total,
        litros: litros
    }));
    
})




$('#completar').click(() => {
    total = totalCompletar;
    totalPagar = total * valor;
    $.post("http://_fuel/completar", JSON.stringify(totalPagar))
})