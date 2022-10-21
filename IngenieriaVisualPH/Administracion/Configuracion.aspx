<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="Configuracion.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web128" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <link href="../Diseño/switch.css" rel="stylesheet" />
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
    <script>
        function swi1() {
            var isChecked = document.getElementById("togBtn1").checked;
            if (isChecked == true) {
                document.getElementById("tablero1").style.display = "block"
            } else {
                document.getElementById("tablero1").style.display = "none"
            }
        }
        function swi2() {
            var isChecked = document.getElementById("togBtn2").checked;
            if (isChecked == true) {
                document.getElementById("tablero2").style.display = "block"
            } else {
                document.getElementById("tablero2").style.display = "none"
            }
        }
        function swi3() {
            var isChecked = document.getElementById("togBtn3").checked;
            if (isChecked == true) {
                document.getElementById("tablero3").style.display = "block"
            } else {
                document.getElementById("tablero3").style.display = "none"
            }
        }
        function swi4() {
            var isChecked = document.getElementById("togBtn4").checked;
            if (isChecked == true) {
                document.getElementById("tablero4").style.display = "block"
            } else {
                document.getElementById("tablero4").style.display = "none"
            }
        }
        function swi5() {
            var isChecked = document.getElementById("togBtn5").checked;
            if (isChecked == true) {
                document.getElementById("tablero5").style.display = "block"
            } else {
                document.getElementById("tablero5").style.display = "none"
            }
        }
        function swi6() {
            var isChecked = document.getElementById("togBtn6").checked;
            if (isChecked == true) {
                document.getElementById("tablero6").style.display = "block"
            } else {
                document.getElementById("tablero6").style.display = "none"
            }
        }
        function swi11() {
            var isChecked = document.getElementById("togBtn11").checked;
            if (isChecked == true) {
                document.getElementById("tablero11").style.display = "block"
            } else {
                document.getElementById("tablero11").style.display = "none"
            }
        }
       function swi12() {
            var isChecked = document.getElementById("togBtn12").checked;
            if (isChecked == true) {
                document.getElementById("tablero12").style.display = "block"
            } else {
                document.getElementById("tablero12").style.display = "none"
            }
        }
        function swi13() {
            var isChecked = document.getElementById("togBtn13").checked;
            if (isChecked == true) {
                document.getElementById("tablero13").style.display = "block"
            } else {
                document.getElementById("tablero13").style.display = "none"
            }
        }
        function swi14() {
            var isChecked = document.getElementById("togBtn14").checked;
            if (isChecked == true) {
                document.getElementById("tablero14").style.display = "block"
            } else {
                document.getElementById("tablero14").style.display = "none"
            }
        }
         function swi15() {
            var isChecked = document.getElementById("togBtn15").checked;
            if (isChecked == true) {
                document.getElementById("tablero15").style.display = "block"
            } else {
                document.getElementById("tablero15").style.display = "none"
            }
        }
    </script>
    <div id="procesando" class="ventana" style="border-radius: 7px;">
        <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <%-- ------------------------------------------------------------------- --%>
      <input type="checkbox" onclick="ShowVideo()" id="btn-modale" />
        <label for="btn-modale" class="lbl-modale">Video Ayuda</label>
        <div class="modale">
            <div class="contenedor" id="mostrarvideo">
                   <header><strong>Video Instructivo (Puedes ajustar la velocidad de reproduccion en 1,5)</strong></header>
                <a href="Configuracion.aspx">&#10006;</a>
                <div class="contenido">
                     <iframe width="1000" height="550" src="https://www.youtube.com/embed/LbkOhQsuemU" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center text-light font-weight-bold">Configuracion del Sistema</h3>
                </div>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Mensaje de Solicitud de Parqueaderos
                            <label class="switch">
                                <input type="checkbox" id="togBtn11" onclick="swi11()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero11" style="display: none">
                            <div>
                                <asp:TextBox ID="txtmsgpar" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnguamsgpar" runat="server" OnClick="btnguamsgpar_Click" Text="Mostrar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

               <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Mensaje de Solicitud de Salon Comunal
                            <label class="switch">
                                <input type="checkbox" id="togBtn12" onclick="swi12()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero12" style="display: none">
                            <div>
                                <asp:TextBox ID="txtmsgsc" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnguamsgsc" runat="server" OnClick="btnguamsgsc_Click" Text="Mostrar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

              <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Mensaje de Solicitud de Chips
                            <label class="switch">
                                <input type="checkbox" id="togBtn13" onclick="swi13()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero13" style="display: none">
                            <div>
                                <asp:TextBox ID="txtmsgchip" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnguamsgchi" runat="server" OnClick="btnguamsgchi_Click" Text="Mostrar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

               <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Mensaje de Solicitud de Mudanza
                            <label class="switch">
                                <input type="checkbox" id="togBtn14" onclick="swi14()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero14" style="display: none">
                            <div>
                                <asp:TextBox ID="txtmsgmud" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnguamsgmud" runat="server" OnClick="btnguamsgmud_Click" Text="Mostrar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Politica y Privacidad de Datos
                            <label class="switch">
                                <input type="checkbox" id="togBtn1" onclick="swi1()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero1" style="display: none">
                            <div>
                                <asp:TextBox ID="txtpolpri" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnpolpri" OnClientClick="return confirm('¿Esta seguro(a) de modificar la politica de datos?');" runat="server" OnClick="btnpolpri_Click" Text="Guardar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Politica de Mudanzas
                <label class="switch">
                    <input type="checkbox" id="togBtn2" onclick="swi2()" value="false">
                    <span class="slider round"></span>
                </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero2" style="display: none">
                            <div>
                                <asp:TextBox ID="txtpolMud" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnpolmud" runat="server" OnClick="btnpolmud_Click" Text="Guardar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.col-->
            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Politica de Convivencia
                <label class="switch">
                    <input type="checkbox" id="togBtn3" onclick="swi3()" value="false">
                    <span class="slider round"></span>
                </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero3" style="display: none">
                            <div>
                                <asp:TextBox ID="txtpolconv" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnpolconv" runat="server" OnClick="btnpolconv_Click" Text="Guardar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Politica de Salon Comunal
                <label class="switch">
                    <input type="checkbox" id="togBtn4" onclick="swi4()" value="false">
                    <span class="slider round"></span>
                </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero4" style="display: none">
                            <div>
                                <asp:TextBox ID="txtpolsc" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnpolsc" runat="server" OnClick="btnpolsc_Click" Text="Guardar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Politica de Parqueadero
                <label class="switch">
                    <input type="checkbox" id="togBtn5" onclick="swi5()" value="false">
                    <span class="slider round"></span>
                </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero5" style="display: none">
                            <div>
                                <asp:TextBox ID="txtpolpar" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                <p></p>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnpolpar" runat="server" OnClick="btnpolpar_Click" Text="Guardar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Mensualidad de Administracion
                        </strong>
                    </div>
                    <div id="tablero6">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvalor" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtadmn" CssClass="form-control" Placeholder="Ingrese Tipo de Administracion" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnguavalAdm" runat="server" OnClick="btnguavalAdm_Click" Text="Agregar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                <section id="tabsc">
                                    <div class="content mt-3">
                                        <div class="animated fadeIn">
                                            <table class="table">
                                                <asp:Repeater ID="r1" runat="server">
                                                    <HeaderTemplate>
                                                        <thead class="thead-dark" style="border-radius: 5px">
                                                            <tr>
                                                                <th><small>Editar<small></th>
                                                                <th><small>Valor de Administracion</small></th>
                                                                <th><small>Tipo de Apartamento<small></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><a href="EditarValor.aspx?Id=<%#Eval("IdValorAdm")%>">
                                                                <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                            </a></td>
                                                            <td><small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("ValorAdm") %></i></small></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Administracion") %></i></small></td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                              </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                    <!-- .animated -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Valores de Descuentos
                        </strong>
                    </div>
                    <div id="tablero7">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:TextBox ID="txtval" CssClass="form-control" TextMode="Number" Placeholder="Ingrese valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:DropDownList ID="ddvalor" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="ValorAdm" DataValueField="IdValorAdm">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT [IdValorAdm], [ValorAdm] FROM [tblValorAdm]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-5">
                                    <div>
                                        <asp:TextBox ID="txtdesc" CssClass="form-control" Placeholder="Ingrese Tipo de Descuento" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btndescuen" runat="server" OnClick="btndescuen_Click" Text="Agregar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                <section id="tabmens">
                                    <div class="content mt-3">
                                        <div class="animated fadeIn">
                                            <table class="table">
                                                <asp:Repeater ID="r2" runat="server">
                                                    <HeaderTemplate>
                                                        <thead class="thead-dark" style="border-radius: 5px">
                                                            <tr>
                                                                <th><small>Editar<small></th>
                                                                <th><small>Descuento<small></th>
                                                                <th><small>Administracion<small></th>
                                                                <th><small>Tipo de descuento<small></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><a href="EditarDescue.aspx?Id=<%#Eval("IdDesc")%>">
                                                                <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                            </a></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("ValorDesc") %></i></small></td>
                                                             <td>
                                                                <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("ValorAdm") %></i></small></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Descuento") %></i></small></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                              </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                    <!-- .animated -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Valores de Salon Comunal
                        </strong>
                    </div>
                    <div id="tablero10">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvasc" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtsc" CssClass="form-control" MaxLength="100" Placeholder="Ingrese Tipo de Salon Comunal" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnsc" runat="server" OnClick="btnsc_Click" Text="Agregar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                <section id="tabcsc">
                                    <div class="content mt-3">
                                        <div class="animated fadeIn">
                                            <table class="table">
                                                <asp:Repeater ID="r5" runat="server">
                                                    <HeaderTemplate>
                                                        <thead class="thead-dark" style="border-radius: 5px">
                                                            <tr>
                                                                <th><small>Editar<small></th>
                                                                <th><small>Valor de Salon Comunal</small></th>
                                                                <th><small>Tipo de Salon Comunal<small></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><a href="EditarSC.aspx?Id=<%#Eval("IdSC")%>">
                                                                <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                            </a></td>
                                                            <td><small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("ValorSC") %></i></small></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("SalCom") %></i></small></td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                              </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                    <!-- .animated -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Valores de Chips
                        </strong>
                    </div>
                    <div id="tablero8">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvalorchip" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtchip" CssClass="form-control" Placeholder="Ingrese Tipo de Chip" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnchip" runat="server" OnClick="btnchip_Click" Text="Agregar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                <section id="tabchi">
                                    <div class="content mt-3">
                                        <div class="animated fadeIn">
                                            <table class="table">
                                                <asp:Repeater ID="r3" runat="server">
                                                    <HeaderTemplate>
                                                        <thead class="thead-dark" style="border-radius: 5px">
                                                            <tr>
                                                                <th><small>Editar<small></th>
                                                                <th><small>Valor de Chip</small></th>
                                                                <th><small>Tipo de Chip<small></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><a href="EditarChip.aspx?Id=<%#Eval("IdChip")%>">
                                                                <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                            </a></td>
                                                            <td><small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("ValorChip") %></i></small></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Chip") %></i></small></td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                              </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                    <!-- .animated -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Configurar Valores de Parqueaderos
                        </strong>
                    </div>
                    <div id="tablero9">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvalopar" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtparqu" CssClass="form-control" Placeholder="Ingrese Tipo de Parqueadero" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnparqu" runat="server" OnClick="btnparqu_Click" Text="Agregar" CssClass=" btn-success font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                <section id="tabchip">
                                    <div class="content mt-3">
                                        <div class="animated fadeIn">
                                            <table class="table">
                                                <asp:Repeater ID="r4" runat="server">
                                                    <HeaderTemplate>
                                                        <thead class="thead-dark" style="border-radius: 5px">
                                                            <tr>
                                                                <th><small>Editar<small></th>
                                                                <th><small>Valor de Parqueadero</small></th>
                                                                <th><small>Tipo de Parqueadero<small></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><a href="EditarParque.aspx?Id=<%#Eval("IdParq")%>">
                                                                <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                            </a></td>
                                                            <td><small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Valor") %></i></small></td>
                                                            <td>
                                                                <small class="text-dark"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Parqueadero") %></i></small></td>

                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                              </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                    <!-- .animated -->
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Contraseñas Funcionarios
                            <label class="switch">
                                <input type="checkbox" id="togBtn15" onclick="swi15()" value="false">
                                <span class="slider round"></span>
                            </label>
                        </strong>
                    </div>
                    <div class="card-body">
                        <div id="tablero15" style="display: none">
                                 <asp:GridView ID="GridView1" Font-Size="Small" runat="server" EmptyDataText="No has ingresado funcionarios" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" ShowFooter="True">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-lg btn-primary">
                        <ControlStyle CssClass="btn btn-lg btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatornom" runat="server" Display="Dynamic"
                                ErrorMessage="El nombre es requerido" ForeColor="Red" ControlToValidate="TextBox1" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cedula" SortExpression="Cedula">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cedula") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorcc" runat="server" Display="Dynamic"
                                ErrorMessage="La cedula es requerida" ForeColor="Red" ControlToValidate="TextBox2" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cedula") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Usuario" SortExpression="Usuario">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contraseña" SortExpression="Contraseña">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Contraseña") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorcont" runat="server" Display="Dynamic"
                                ErrorMessage="La contraseña es requerida" ForeColor="Red" ControlToValidate="TextBox4" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Contraseña") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" runat="server" ForeColor="Red" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" DeleteCommand="DELETE FROM [tblIDfuncionario] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblIDfuncionario] ([Nombre], [Cedula], [Usuario], [Contraseña]) VALUES (@Nombre, @Cedula, @Usuario, @Contraseña)" SelectCommand="SELECT * FROM [tblIDfuncionario]" UpdateCommand="UPDATE [tblIDfuncionario] SET [Nombre] = @Nombre, [Cedula] = @Cedula, [Usuario] = @Usuario, [Contraseña] = @Contraseña WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Cedula" Type="String" />
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Contraseña" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Cedula" Type="String" />
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Contraseña" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

         

        </form>
    </div>

</asp:Content>
