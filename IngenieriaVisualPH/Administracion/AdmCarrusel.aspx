<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AdmCarrusel.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web115" %>
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
              <header><strong>Video Instructivo (Puedes ajustar la velocidad de reproduccion en 1,5)</strong></header>
                <a href="AdmCarrusel.aspx">&#10006;</a>
                <div class="contenido">
                    <iframe width="1000" height="550" src="https://www.youtube.com/embed/FF-GNSYGj-M" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center text-light font-weight-bold">Imagenes del Carrusel</h3>
            </div>
        </div>
        <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
            <strong>Debe ingresar las 8 imagenes</strong>
        </div>
        <div class="alert alert-success" id="erro1" runat="server" style="margin-top: 10px; display: none">
            <strong>Imagnes cargadas en el carrusel correctamente</strong>
        </div>
        <form runat="server" id="fo1">
            <section class="content">
                  <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Tablero del Carrusel</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <asp:Repeater ID="r2" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Imagen1</th>
                                                        <th>Imagen2</th>
                                                        <th>Imagen3</th>
                                                        <th>Imagen4</th>
                                                        <th>Imagen5</th>
                                                        <th>Imagen6</th>
                                                        <th>Imagen7</th>
                                                        <th>Imagen8</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><img src="../<%#Eval("img1") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img2") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img3") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img4") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img5") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img6") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img7") %>" height="70" width="100"></td>
                                                    <td><img src="../<%#Eval("img8") %>" height="70" width="100"></td>
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
            </div><!-- .animated -->
                <div class="row">
                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 1</label>
                                    <asp:Label ID="lblimg1" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f1" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 2</label>
                                    <asp:Label ID="lblimg2" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f2" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 3</label>
                                    <asp:Label ID="lblimg3" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f3" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 4</label>
                                    <asp:Label ID="lblimg4" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f4" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 5</label>
                                    <asp:Label ID="lblimg5" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f5" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 6</label>
                                    <asp:Label ID="lblimg6" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f6" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 7</label>
                                    <asp:Label ID="lblimg7" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f7" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Imagen 8</label>
                                    <asp:Label ID="lblimg8" CssClass="text-success" runat="server" Text=""></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-picture-o"></i></div>
                                        <asp:FileUpload ID="f8" runat="server" Font-Bold="true" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Actualizar Imagenes" OnClick="btnactualizar_Click" />
                </div>
                <br />
               
            </section>
        </form>
    </div>
</asp:Content>
