// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



var ready;

ready = function() {


	$( ".delete" ).click(function() {
		var r = confirm("Are you sure you want to delete this item?");
		if (r == true) {
		    var targetId = $( this ).attr('id');
			// alert( "Handler for .click() called. " + targetId );

			var url = window.location;
			var requestUrl = url .protocol + "//" + url.host + "/registry_item/delete"


			// make delete request

			$.post( requestUrl , { id: targetId } );
			// $.ajax({
			//   type: "POST",
			//   url: requestUrl,
			//   data: data,
			//   success: success,
			//   dataType: ''
			// });
			location.reload();
		}

	});
}


$(document).ready(ready);
$(document).on('page:load', ready);