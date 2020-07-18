<!doctype html>
<html lang="en">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <#import "parts/menu.ftl" as m>
    <title>Project Management System - User Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href ="../css/main.css">


</head>
<body>


<div class="container-fluid">
    <@m.menu/>
    <br>
    <div class="row">
        <div class="col-3">
            <div class="card">
                <div class="card-header">
                    <h5>User Profile - ${loggedUser}</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                    <h6>Change password:</h6>
                            <form action="/changeUserPassword" method="post">
                    <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password" id="password" name="password" placeholder="Enter new password">
                                <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                                </#if>
                            <br>
                    <input class="form-control ${(passwordDifferentError??)?string('is-invalid', '')}" type="password" id="password_confirmation" name="passwordConfirm" placeholder="Confirm new password">
                                <#if password2Error??>
                                    <div class="invalid-feedback">
                                        ${password2Error}
                                    </div>
                                </#if>
                                <#if passwordDifferentError??>
                                    <div class="invalid-feedback">
                                        ${passwordDifferentError}
                                    </div>
                                </#if>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="username" value="${loggedUser}"/>
                                <br>
                                <input type="submit" class="btn btn-success btn-sm" value="Submit">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<#--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>