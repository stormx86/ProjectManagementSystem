<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <#import "parts/menu.ftl" as m>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href ="../../css/main.css">
    <title>Edit project</title>

    <script>
        var autocompl_opt = {source: "/projects/getUserNames", minLength: 2};
        $(document).ready(function autocompleteReady () {
            $(".form-control").each(function () {
                $(this).autocomplete(autocompl_opt);
            })
        });
    </script>

    <#--Set selected role in <select> - ADVANCED VERSION-->
    <script>
        $(document).ready(function () {
        $("select.form-control").each(function() {
            var specifiedID = this.id;
            $(this).val(specifiedID);})
        });
    </script>


    <script>
        function saveProject() {
            var roles = [], users = [];
            $("select").each(function () {
               roles.push($(this).val());
            })
            $('input[name="userMember"]').each(function(){
                users.push($(this).val());
            })
            var title = $('input[name="title"]').val();
            var description =$('textarea[name="description"]').val();
            var projectManager = $('input[name="projectManager"]').val();
            $.ajax({
                headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
                url: "/projects/save",
                type: "POST",
                data: {id: ${project.getId()}, title: title, description: description, projectManager: projectManager, roles: roles, users: users},
                success: function(response){
                    $("#save_success").empty();
                    $("#save_success").append(response);
                    $("#save_success").delay(2000).fadeOut("slow", "swing");
                }
            })
        }
    </script>


    <script>
        function deleteRole() {
            $('#tb_roles').on('click', 'button', function(){
                $(this).closest('tr').remove();
            });
        }
    </script>

    <#--Adding new select with roles and users-->
    <script>
        $(document).ready(function () {
            $("#add_role").click(function () {
               var markup = $("<tr><td><select class=\"form-control\" name=\"role\">\n" +
                    "                                <#list existingRoles as er>\n" +
                    "                                    <option value=\"${er}\">${er}</option>\n" +
                    "                                </#list>\n" +
                    "                            </select></td><td><input class=\"form-control\" id=\"user_member\" type=\"text\"  name=\"userMember\" ></td><td>\n" +
                   "                            <button onclick=\"deleteRole()\" class=\"btn btn-link btn-sm\">\n" +
                   "                                <i style=\"color: dimgray\" class=\"fa fa-trash\" aria-hidden=\"true\"></i>\n" +
                   "                            </button>\n" +
                   "                        </td></tr>");
                tableBody = $("#tb_roles tbody");
                $(".form-control", markup).autocomplete(autocompl_opt);
                tableBody.append(markup);
            });
        });
    </script>


</head>
<body>

<div class="container-fluid">
    <@m.menu/>
    <br>
    <form>
        <input class="btn btn-primary btn-sm" type="button" value="<--Back" onclick="window.location.replace('http://localhost:8080/projects/${project.id}')">
    </form>
    <h3>Edit project</h3>
    <div class="row">

        <div class="col-3">

            <div class="card">
                <h5 class="card-header">Project members:</h5>
                <table id="tb_roles" class="table table-sm">
                    <tbody>
                    <tr>
                        <td style="text-align: center; vertical-align: middle;"><span class="card-text"><h6>Creator:</h6></span></td>
                        <td><input class="form-control" id="creator" type="text" name="creator" readonly="readonly" value="${project.creator}"></td>
                    </tr>
                    <tr>
                        <td style="text-align: center; vertical-align: middle;"><span class="card-text"><h6>Project manager:</h6></span></td>
                        <td><input class="form-control" id="project_manager" type="text" name="projectManager" value="${project.projectManager}"></td>
                    </tr>
                    <#list project.roleUser as ru>
                        <tr>
                            <td>
                                <select  class="form-control" id="${ru?keep_before(":")}" name="role">
                                    <#list existingRoles as er>
                                        <option value="${er}">${er}</option>
                                    </#list>
                                </select>
                            </td>
                            <td><input class="form-control" id="user_member" type="text"  name="userMember" value="${ru?keep_after(":")}"></td>
                            <td>
                                <button onclick="deleteRole()" class="btn btn-link btn-sm">
                                    <i style="color: dimgray" class="fa fa-trash" aria-hidden="true"></i>
                                </button>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>

            </div>
            <br>
            <button id="add_role" class="btn btn-primary btn-sm">Add role</button><br><br>
            <button onclick="saveProject()" class="btn btn-success btn-sm">Save</button><br>
            <span style="font-size: 12px" id="save_success" class="badge badge-success"></span>
        </div>
        <div class="col-6">
            <div class="card">
                <h5 class="card-header">Project title:</h5>
                <input class="form-control" type="text" name="title" value="${project.title}">
            </div>
<br><br><br>
            <div class="card">
                <h5 class="card-header">Description:</h5>
                <textarea class="form-control" name="description"  rows="12">${project.description}</textarea>
            </div>
        </div>
    </div>
</div>










<#--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>