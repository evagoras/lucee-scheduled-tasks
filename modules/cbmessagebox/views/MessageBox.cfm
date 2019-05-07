<cfsetting enablecfoutputonly=true>
<cfoutput>
<cfif NOT variables.styleOverride>
<style type="text/css">
.cbox_messagebox{
	position: relative;
	padding: .75rem 1.25rem;
	margin-bottom: 1rem;
	border: 1px solid transparent;
	border-radius: .25rem;
}
.cbox_messagebox a{
	color: ##002752;
	font-weight: 700;
	text-decoration: none;
}
.cbox_messagebox a:hover{
	text-decoration: underline;
}
.cbox_messagebox_success{
	color: ##155724;
	background-color: ##d4edda;
	border-color: ##c3e6cb;
}
.cbox_messagebox_info{
	color: ##0c5460;
	background-color: ##d1ecf1;
	border-color: ##bee5eb;
}
.cbox_messagebox_warn{
	color: ##856404;
	background-color: ##fff3cd;
	border-color: ##ffeeba;
}
.cbox_messagebox_error{
	color: ##721c24;
	background-color: ##f8d7da;
	border-color: ##f5c6cb;
}
.cbox_messagebox_dark{
	color: ##1b1e21;
	background-color: ##d6d8d9;
	border-color: ##c6c8ca;
}
.cbox_messagebox_light{
	color: ##383d41;
	background-color: ##e2e3e5;
	border-color: ##d6d8db;
}
</style>
</cfif>
<div class="cbox_messagebox cbox_messagebox_#msgStruct.type#">
	#msgStruct.message#
</div>
</cfoutput>
<cfsetting enablecfoutputonly="false">