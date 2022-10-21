<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="Asamblea.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web123" %>
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
    <%-- ------------------------------------------------------------------- --%>
      <input type="checkbox" onclick="ShowVideo()" id="btn-modale" />
        <label for="btn-modale" class="lbl-modale">Video Ayuda</label>
        <div class="modale">
            <div class="contenedor" id="mostrarvideo">
                <header>Video Instructivo</header>
                <a href="Asamblea.aspx">&#10006;</a>
                <div class="contenido">
                     <iframe width="1000" height="550" src="https://www.youtube.com/embed/FF-GNSYGj-M" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
        <form id="f2" runat="server">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center text-light font-weight-bold">Cargar Documentos en PDF</h3>
            </div>
        </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-body">
                        <div class="alert alert-warning" runat="server">
                            <strong>Solo es permitido subir PDF, peso max 2mb</strong>
                        </div>
                        <div class="alert alert-danger" runat="server" style="display: none; margin-top: 10px" id="error2">
                            <strong>Solo es permitido subir PDF</strong>
                        </div>
                        <div class="alert alert-success" runat="server" style="display: none; margin-top: 10px" id="div1">
                            <strong>Cargado Correctamente</strong>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
                                <p class="font-weight-bold">Nombre del Documento</p>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-file-text-o"></i></div>
                                    <asp:TextBox ID="txtnom" runat="server" CssClass="form-control" Text=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                        ErrorMessage="Asigne un Mensaje" ForeColor="Red" ControlToValidate="txtnom" Text="* Obligatorio">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-6">
                                <p class="font-weight-bold">Adjuntar Documento</p>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-paperclip"></i></div>
                                    <asp:FileUpload ID="f1" runat="server" Font-Bold="true" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                        ErrorMessage="Asigne un Mensaje" ForeColor="Red" ControlToValidate="f1" Text="* Obligatorio">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="col-xs-6 col-lg-4">
                            <div class="form-group">
                                <asp:Button ID="btnnot" Style="border-radius: 7px" Font-Bold="true" runat="server" class="btn btn-lg btn-success" Text="Subir Documento" OnClick="btnnot_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <section id="tabsc">
                <div class="content mt-3">
                    <div class="animated fadeIn">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card" style="border-radius: 7px">
                                        <div class="card-body">
                                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                            <asp:Repeater ID="r1" runat="server">
                                                <HeaderTemplate>
                                                    <thead class="thead-dark" style="border-radius: 5px">
                                                        <tr>                                                            
                                                            <th><small>Eliminar<small></th>
                                                            <th><small>Ver PDF<small></th>
                                                            <th><small>Fecha</small></th>
                                                            <th><small>Nombre de Documento<small></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><a href="EliminarMsg.aspx?Id=<%#Eval("FileID")%>">
                                                            <button class="btn btn-lg btn-danger font-weight-bold" onclick="return confirm('¿Esta seguro(a) de eliminar el documento?');" type="button" style="border-radius: 5px" title="Eliminar"><i class="fa fa-trash-o"></i></button>
                                                        </a></td>
                                                      <td><a href="AsambleaVer.aspx?Id=<%#Eval("FileID")%>">
                                                                <button class="btn btn-lg btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Ver PDF"><i class="fa fa-download"></i></button>
                                                            </a></td>
                                                        <td>
                                                            <h5 class="text-dark"><i class="fa fa-calendar">&nbsp;<%#Eval("Fecha") %></i></h5></td>
                                                           <td> <h5 class="text-dark"><i class="fa fa-clipboard">&nbsp;<%#Eval("Nombre") %></i></h5></td>
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
                </div>
                <!-- .animated -->
            </section>
        </form>
    </div>
    <script src="../Diseño/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../Diseño/assets/js/popper.min.js"></script>
    <script src="../Diseño/assets/js/plugins.js"></script>
    <script src="../Diseño/assets/js/main.js"></script>

    <script src="../Diseño/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/datatables-init.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
</asp:Content>
