// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready;

ready = function() {


	$( ".mark-fulfilled" ).click(function() {
		var r = confirm("Are you sure you want to mark this pledge as fulfilled?");
		if (r == true) {
		    var targetId = $( this ).attr('id');
			var url = window.location;
			var requestUrl = url.protocol + "//" + url.host + "/pledge/mark_fulfilled"

			alert(requestUrl)
			// make update request

			$.post( requestUrl , { id: targetId } );
			location.reload();
		}

	});

	$( ".delete-pledge" ).click(function() {
		var r = confirm("Are you sure you want to delete this pledge?");
		if (r == true) {
		    var targetId = $( this ).attr('id');
			// alert( "Handler for .click() called. " + targetId );

			var url = window.location;
			var requestUrl = url .protocol + "//" + url.host + "/pledge/delete"


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