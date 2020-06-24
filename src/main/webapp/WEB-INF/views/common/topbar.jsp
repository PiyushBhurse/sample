<style>
    .navbar, .dropdown-menu{
        background:rgba(255,255,255,0.25);
        border: none;

    }

    .nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .dropdown-menu>li>a, .dropdown-menu>li{
        border-bottom: 3px solid transparent;
    }
    .nav>li>a:focus, .nav>li>a:hover,.nav .open>a, .nav .open>a:focus, .nav .open>a:hover, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover{
        border-bottom: 3px solid transparent;
        background: none;
    }
    .navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
        color: #fff;
    }
    .dropdown-menu{
        -webkit-box-shadow: none;
        box-shadow:none;
    }

    .nav li:hover:nth-child(8n+1), .nav li.active:nth-child(8n+1){
        border-bottom: #C4E17F 3px solid;
    }
    .nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2){
        border-bottom: #F7FDCA 3px solid;
    }
    .nav li:hover:nth-child(8n+3), .nav li.active:nth-child(8n+3){
        border-bottom: #FECF71 3px solid;
    }
    .nav li:hover:nth-child(8n+4), .nav li.active:nth-child(8n+4){
        border-bottom: #F0776C 3px solid;
    }
    .nav li:hover:nth-child(8n+5), .nav li.active:nth-child(8n+5){
        border-bottom: #DB9DBE 3px solid;
    }
    .nav li:hover:nth-child(8n+6), .nav li.active:nth-child(8n+6){
        border-bottom: #C49CDE 3px solid;
    }
    .nav li:hover:nth-child(8n+7), .nav li.active:nth-child(8n+7){
        border-bottom: #669AE1 3px solid;
    }
    .nav li:hover:nth-child(8n+8), .nav li.active:nth-child(8n+8){
        border-bottom: #62C2E4 3px solid;
    }

    .navbar-toggle .icon-bar{
        color: #fff;
        background: #fff;
    }
    .dropdown-toggle{
        background: #1D2127;
    }
    .navbar-nav>li>.dropdown-menu {
        margin-top: 0;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        background: #1D2127;
    }
    .datepicker{
        background: white;
    }
</style>

<!-- START X-NAVIGATION VERTICAL -->
<div>
    <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
        <li class="xn-titleText">
        <spring:message code="appName"/> &nbsp;&nbsp;&nbsp;</span>
        </li>
        <!-- SIGN OUT -->
        <li class="pull-right">
            <a href="#" class="mb-control" onclick="formSubmit()">Logout <span class="fa fa-sign-out"></span></a>                        
        </li> 
        <li class="pull-right"  style="margin-top: 1%;margin-left: 15px;">
            <span class="mb-control" style="color: white;text-align:center;font-size: medium;">&nbsp;|</span>
        </li> 
        <li class="pull-right" style="margin-top: 1%;">
            <span class="mb-control" style="color: white;text-align:center;font-size: medium;"> Welcome ${curUser.user.firstName} ${curUser.user.lastName}</span>       
        </li> 
        <!-- END SIGN OUT -->
    </ul>
</div>
<!-- END X-NAVIGATION VERTICAL --> 
<!--<div class="navbar">
    <c:choose>
        <c:when test="${savingAccount eq null}">
            <a href="../account/createSavingsAccount">Open Saving Account</a>
        </c:when>
        <c:otherwise>
            <a onclick=" $('.depAmt').change();$('#modalForm').modal('show');" >Open Term Account</a>
        </c:otherwise>
    </c:choose>
    <a href="../account/beneficiaryAndTransfer">Add Beneficiary</a>
    <a href="../account/beneficiaryAndTransfer">Fund Transfer</a>
    <a onclick="$('#tranModal').modal('show');">Transactions</a>
    <div class="dropdown">
        <button class="dropbtn">Dropdown 
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div> 
</div>-->
<div>
    <div class="navbar-wrapper">
        <div class="container-fluid" style="padding: 0;margin: 0;">
            <nav class="navbar" style="background: #1D2127;margin-top: 3.7%;">
                <!--<nav class="navbar navbar-fixed-top" style="margin-top: 3.7%;background: #1D2127;padding-top: 0px;padding-bottom: 1px;">-->
                <div class="container" style="width: 100%;padding: 0;">
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class=""><a href="../home/index" class="">Home</a></li>
                            <li class=" dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Accounts<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <c:choose>
                                        <c:when test="${savingAccount eq null}">
                                            <li class=" dropdown">
                                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Open Saving Account</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="#" onclick="$('.depAmt').change();$('#modalForm').modal('show');">Open Term Account</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </li>
                            <li><a href="../account/beneficiaryAndTransfer">Transfer Funds</a></li>
                            <li><a onclick="$('#tranModal').modal('show');">Statements</a></li>
                        </ul>
                        <ul class="nav navbar-nav pull-right">
                            <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Signed in as  <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Change Password</a></li>
                                    <li><a href="#">My Profile</a></li>
                                </ul>
                            </li>
                            <li class=""><a href="#">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>

<form action="../logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>
