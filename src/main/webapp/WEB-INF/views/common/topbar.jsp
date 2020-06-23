<style>
    .navbar {
        overflow: hidden;
        background-color: #333;
    }

    .navbar a {
        float: left;
        font-size: 16px;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .dropdown {
        float: left;
        overflow: hidden;
    }

    .dropdown .dropbtn {
        font-size: 16px;  
        border: none;
        outline: none;
        color: white;
        padding: 14px 16px;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
    }

    .navbar a:hover, .dropdown:hover .dropbtn {
        background-color: red;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        float: none;
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>

<!-- START X-NAVIGATION VERTICAL -->
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
<!-- END X-NAVIGATION VERTICAL --> 
<div class="navbar">
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
</div>

<form action="../logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>
