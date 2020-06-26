
<!-- START PLUGINS -->
<script type="text/javascript" src="../js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="../js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="../css/jquery/jquery-ui-1.12.1.css">
<!-- END PLUGINS -->

<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="cache-control" content="no-store, must-revalidate" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 CST" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script>
	$('.yearpicker').datepicker({
		minViewMode : 2,
		format : 'yyyy',
		autoclose : true
	})
			.datepicker('setStartDate',
					new Date(new Date().getFullYear() - 16, 0, 1));
	//            .datepicker('setEndDate', new Date(new Date().getFullYear() - 4, 0, 1));
	$(".dob").datepicker({
		format : 'mm-dd-yyyy',
		defaultViewDate : new Date(new Date().getFullYear() - 36, 0, 1),
		startDate : new Date(new Date().getFullYear() - 36, 0, 1),
		autoclose : true
	}).datepicker('setEndDate', new Date(new Date().getFullYear() - 18, 0, 1));
	$(".expiryDate").datepicker({
		format : "mm-yyyy",
		minViewMode : 1,
		startDate : "-0m",
		autoclose : true
	});
	$('.number')
			.keypress(
					function(event) {
						var keycode = event.which;
						if (!(event.shiftKey == false && (keycode == 46
								|| keycode == 8 || keycode == 37
								|| keycode == 39 || (keycode >= 48 && keycode <= 57)))) {
							event.preventDefault();
						}
					});
</script>

<!-- END SCRIPTS -->
