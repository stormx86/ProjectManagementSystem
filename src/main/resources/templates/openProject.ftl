<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <#import "parts/menu.ftl" as m>
    <title>Welcome to the Project Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


</head>
<body>




<div class="container-fluid">
    <@m.menu/>
    <br>
    <div class="row">
        <div class="col">
            <form action="/projects/edit/${project.id}" method="get">
                <input class="btn btn-primary btn-sm" type="submit" value="Edit project"/>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <div class="row">
                <div class="col">
                    <table class="table table-sm table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Project members</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list project.roleUser?keys as key>
                            <tr>
                                <td>${key} : ${project.roleUser[key]}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="col-6">
            <table class="table table-sm table-bordered">
                <tbody>

                    <tr>
                        <td>
                            <b>${project.title}</b>
                        </td>
                    </tr>

                    <tr>
                        <td style="white-space:pre-wrap">${project.description}</td>
                    </tr>

                </tbody>
            </table>


        </div>
    </div>
</div>





<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>