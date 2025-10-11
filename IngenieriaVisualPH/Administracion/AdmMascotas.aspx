<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AdmMascotas.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web157" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <link href="../Diseño/Video.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;

        function ShowVideo() {
           document.getElementById("conta").style.display = "none"
           document.getElementById("procesando").style.display = "none"
        }
        function CloseVideo() {
            document.getElementById("conta").style.display = "block"
        }
    </script>
            <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
               <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />     
        </div>

    <div class="container" id="conta">
        <form id="form1" runat="server">
            <a href="VerTablaMascotas.aspx">
            <div class="card col-md-3 no-padding ">
                <div class="card-body">
                    <div class="h1 text-muted text-right mb-4">
                        <i class="fa fa-check-circle"></i>
                    </div>
                    <div class="h1 mb-0">
                        <span class="count text-success">
                            <asp:Label ID="lblnot8" runat="server"></asp:Label></span>
                    </div>
                    <h4 class="text-muted text-uppercase font-weight-bold">MASCOTAS REGISTRADAS</h4>
                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                </div>
            </div></a>
         <section id="tabmascotas" runat="server">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">ESTADO DE REGISTRO MASCOTAS</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Codigo</th>
                                                        <th>Estado</th>
                                                        <th>Nombre Mascota</th>
                                                        <th>Raza</th>
                                                        <th>RazaEspecial</th>
                                                        <th>Encargado</th>
                                                        <th>Respuesta</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerMascota.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar Registro</i></button>
                                                    </a></td>
                                                     <td>
                                                        <small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("Codigo") %></i></small></td>
                                                     <td>
                                                        <small class="text-danger"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small ><%#Eval("Nombre") %></i></small></td>
                                                     <td>
                                                        <small ><%#Eval("Raza") %></i></small></td>
                                                                                                         <td>
                                                        <small ><%#Eval("RazaEspecial") %></i></small></td>
                                                   <td>
                                                        <small ><%#Eval("NombreEncargado") %></i></small></td> 
                                                   <td>
                                                        <small><%#Eval("Respuesta") %></i></small></td>   
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                              </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
 <script src="../Diseño/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="..Diseño/assets/js/popper.min.js"></script>
    <script src="..Diseño/assets/js/plugins.js"></script>
    <script src="..Diseño/assets/js/main.js"></script>


    <script src="..Diseño/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/datatables-init.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
            <br />
            <br />
            <br />
            <br />         
        </form>
     </div>
</asp:Content>
