<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Card Consent Batch Processing</title>
	<meta name="description" content="Card Consent Batch Processing Application">
    <meta name="author" content="Evagoras Charalambous">
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
	<!---css --->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<style>
		html {
			overflow-y: scroll;
		}
	</style>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
		crossorigin="anonymous"></script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50" style="padding-top: 70px">
	<!---Top NavBar --->
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg fixed-top" role="navigation">
		<!---Brand --->
		<a class="navbar-brand" href="#event.buildLink('')#"><strong>Home</strong></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a href="#event.buildLink('scheduledtasks')#" class="nav-link"><i class="far fa-calendar-alt"></i> Scheduled Tasks</a>
				</li>
			</ul>
		</div>

	</nav> <!---end navbar --->

	<!---Container And Views --->
	<div class="container-fluid">
		#getInstance("messagebox@cbmessageBox").renderIt()#
		#renderView()#
	</div>

	<footer class="border-top py-3 mt-5">
		<div class="container">
			<p class="float-right">
				<a href="#event.buildLink('')#?fwreinit"><i class="fas fa-sync-alt"></i> FW Reinit</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="##"><i class="fas fa-arrow-up"></i> Back to top</a>
			</p>
		</div>
	</footer>

	<!---js --->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script>
	$(function() {
		// activate all drop downs
		$('.dropdown-toggle').dropdown();
		// Tooltips
		$('[data-toggle="tooltip"]').tooltip();
		// automatically close the alerts
		// setTimeout(function() {
		// 	$(".alert").alert('close');
		// }, 10000);
	})
	</script>
</body>
</html>
</cfoutput>
