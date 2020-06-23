<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <%@include file="../common/meta.jsp"%>
        <%@include file="../common/css.jsp"%>
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-navigation-toggled page-container-wide">
            <%@include file="../common/topbar.jsp" %>
            <!-- PAGE CONTENT -->
            <div class="page-content">
                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Customer List</a></li>
                    <li><a href="#">Activate Customer</a></li>
                </ul>
                <!-- END BREADCRUMB --> 
                <div class="page-content-wrap" >
                    <%@include file="../common/message.jsp"%>
                    <!-- PAGE TITLE -->
                    <div class="">
                        <div class="page-title">                    
                            <h2><span class="fa fa-arrow-circle-o-left" onclick="location.href = '../home/index'"></span>&nbsp;Activate Customer Account</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <form:form cssClass="form-horizontal" action="#?${_csrf.parameterName}=${_csrf.token}" modelAttribute="registration" name="form1" id="form1" enctype="multipart/form-data">
                                    <!--Customer details-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><b><i>Basic Details</i></b></h3>
                                        </div>

                                        <div class="row" style="margin-top: 5%">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">First Name</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="firstName" maxlength="100" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter first name</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Last Name</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="lastName" maxlength="100" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter last name</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div><br/>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Username</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="username" maxlength="100" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter username for account</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Date of Birth</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="dob" cssClass="form-control datepicker" readonly="true"/>                                       
                                                        <span class="help-block">Please select date of birth</span>
                                                    </div>
                                                </div>
                                            </div>                               
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Email Id</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="emailId" maxlength="100" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter email id</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Mobile No</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="mobileNumber" maxlength="10" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter mobile no</span>
                                                    </div>
                                                </div>
                                            </div>                               
                                        </div><br/>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Aadhar Id</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="aadharId" maxlength="16" cssClass="form-control" value=""/>                                       
                                                        <span class="help-block">Please enter aadhar id</span>
                                                    </div>
                                                </div>
                                            </div> 

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">PAN</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="pan" maxlength="10" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter pan</span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div><br/>
                                    </div><br/>

                                    <!--Address details-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><b><i>Address Details</i></b></h3>
                                        </div>

                                        <div class="row" style="margin-top: 5%">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Address 1</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:textarea path="addLine1" rows="1" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter address line 1</span>
                                                    </div>
                                                </div>
                                            </div>                                 
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Address 2</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:textarea path="addLine2" rows="1" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter address line 2</span>
                                                    </div>
                                                </div>
                                            </div>                                 
                                        </div><br/>                                 

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">City</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="city" maxlength="50" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter city</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">State</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="state" maxlength="50" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter state</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Pincode</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="pin"  maxlength="6" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter pincode</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div><br/>
                                    </div>

                                    <!--Upload documents-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><b><i>Upload Documents</i></b></h3>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="panel-title" style="margin-left:3%"><li>DOB Proof</li></h5>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label" data-er="Identity">Download Document</label>
                                                    <div class="col-md-8 col-xs-12" data-file-name="${registration.kycData[0].documentLoc}">
                                                        <button type="button" class="btn btn-warning viewDoc" >View Document</button>
                                                        <form:hidden path="kycData[0].kycType" cssClass="form-control" value="B"/>                                       
                                                        <span class="help-block">Click to view the uploaded document</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Document Desc</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="kycData[0].documentDesc" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter document desc</span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="panel-title" style="margin-left:3%"><li>Address Proof</li></h5>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label" data-er="Identity">Download Document</label>
                                                    <div class="col-md-8 col-xs-12" data-file-name="${registration.kycData[1].documentLoc}">
                                                        <button type="button" class="btn btn-warning viewDoc" >View Document</button>
                                                        <form:hidden path="kycData[1].kycType" cssClass="form-control" value="A"/>                                       
                                                        <span class="help-block">Click to view the uploaded document</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Document Desc</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="kycData[1].documentDesc" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter document desc</span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div><br/>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="panel-title" style="margin-left:3%"><li>Aadhar Card</li></h5>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label" data-er="Identity">Download Document</label>
                                                    <div class="col-md-8 col-xs-12" data-file-name="${registration.kycData[2].documentLoc}">
                                                        <button type="button" class="btn btn-warning viewDoc" >View Document</button>
                                                        <form:hidden path="kycData[2].kycType" cssClass="form-control" value="D"/>                                       
                                                        <span class="help-block">Click to view the uploaded document</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Document Desc</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="kycData[2].documentDesc" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter document desc</span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div><br/>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="panel-title" style="margin-left:3%"><li>PAN Card</li></h5>
                                            </div>
                                        </div><br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label" data-er="Identity">Download Document</label>
                                                    <div class="col-md-8 col-xs-12" data-file-name="${registration.kycData[3].documentLoc}">
                                                        <button type="button" class="btn btn-warning viewDoc" >View Document</button>
                                                        <form:hidden path="kycData[3].kycType" cssClass="form-control" value="P"/>                                       
                                                        <span class="help-block">Click to view the uploaded document</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="req col-md-3 control-label">Document Desc</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <form:input path="kycData[3].documentDesc" cssClass="form-control"/>                                       
                                                        <span class="help-block">Please enter document desc</span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div><br/>
                                    </div>

                                    <div class="panel-footer">
                                        <div class="pull-right" data-user-id="${registration.userId}">
                                            <button type="button" class="btn btn-success btnFun"><spring:message code="button.Activate"/></button>
                                            <button type="button" class="btn btn-info btnFun"><spring:message code="button.Deactivate"/></button>
                                            <button type="button" name="_cancel" class="btn btn-danger" onclick="location.href = '../customer/customerList?msg=Action canceled'"><spring:message code="button.Cancel"/></button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form:form>
                    </div>
                </div><br>
                <!-- END PAGE TITLE -->
            </div>
            <!-- START PAGE CONTAINER -->
            <form name="form2" id="form2" action="" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" id="filePath" name="filePath"/>
            </form>
            <form name="form3" id="form3" action="" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" id="active" name="active"/>
                <input type="hidden" id="userId" name="userId"/>
            </form>
        </div>
    </div>
    <%@include file="../common/script.jsp"%>
    <!-- START THIS PAGE PLUGINS-->        
    <script type="text/javascript" src="../js/datatables/jquery.dataTables.min.js"></script> 
    <script type="text/javascript" src="../js/bootstrap/bootstrap-select.js"></script>
    <script type='text/javascript' src='../js/jquery-validation/jquery.validate.js'></script>
    <!-- END THIS PAGE PLUGINS-->        
    <script type="text/javascript">
                                                $(".datepicker").datepicker({format: 'dd-mm-yyyy', autoclose: true});
                                                $(document).ready(function () {
                                                    $.validator.addMethod(
                                                            "checkEmail",
                                                            function () {
                                                                var email = $('#emaiId').val();

                                                                var filter = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                                                                if (filter.test(email)) {
                                                                    return true;
                                                                } else {
                                                                    return false;
                                                                }

                                                            }, "Please enter correct email id"
                                                            );
                                                });
                                                $(document).ready(function () {
                                                    $.validator.addMethod(
                                                            "checkIFileExtension",
                                                            function () {
                                                                var filename = $('#apfile').val();
                                                                if (filename != "") {
                                                                    var ext = filename.split('.').pop().toLowerCase();
                                                                    if ($.inArray(ext, ['png', 'jpg', 'jpeg']) == -1) {
                                                                        return false
                                                                    } else {
                                                                        return true;
                                                                    }
                                                                } else {
                                                                    return true;
                                                                }
                                                            }, 'Please select only png, jpg, jpeg file'
                                                            );
                                                }
                                                );
                                                var jvalidate = $("#form1").validate({
                                                    ignore: [],
                                                    rules: {
                                                        firstName: {
                                                            required: true,
                                                            minlength: 2
                                                        },
                                                        lastName: {
                                                            minlength: 2,
                                                            required: true
                                                        },
                                                        username: {
                                                            required: true
                                                        },
                                                        dob: {
                                                            required: true
                                                        },
                                                        emailId: {
                                                            maxlength: 50,
                                                            required: true,
                                                            email: true
                                                        },
                                                        mobileNumber: {
                                                            required: true,
                                                            number: true
                                                        },
                                                        aadharId: {
                                                            number: true
                                                        },
                                                        addLine1: {
                                                            required: true
                                                        },
                                                        addLine2: {
                                                            required: true
                                                        },
                                                        city: {
                                                            required: true
                                                        },
                                                        state: {
                                                            required: true
                                                        },
                                                        pin: {
                                                            required: true,
                                                            minlength: 6
                                                        },
                                                        pan: {
                                                            minlength: 10
                                                        },
                                                        aadhar: {
                                                            minlength: 16,
                                                            number: true
                                                        }
                                                    },
                                                    errorPlacement: function (error, element) {
                                                        if (element.hasClass('select')) {
                                                            error.insertAfter(element.next(".bootstrap-select"));
                                                            element.next("div").addClass("error");
                                                        } else {
                                                            error.insertAfter(element);
                                                        }
                                                    }
                                                });

                                                $(".viewDoc").click(function () {
                                                    $('#filePath').val($(this).parent().data("file-name"));
                                                    $('#form2').prop('action', '../download/kyc');
                                                    $('#form2').submit();
                                                });
                                                $(".btnFun").click(function () {
                                                    if ($(this).text() == 'Activate') {
                                                        $('#active').val("A");
                                                    } else {
                                                        $('#active').val("N");
                                                    }
                                                    $('#userId').val($(this).parent().data("userId"));
                                                    $('#form3').prop('action', '../customer/confirmCustomer');
                                                    $('#form3').submit();
                                                });

    </script>
</body>
</html>