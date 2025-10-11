<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpAlquilerParqueaderoCM.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web122" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
            }
            window.onbeforeunload = DesactivarBoton;
        </script>
        <script>
            function f1SI() {
                document.getElementById("ActualGuarda").style.display = "none";
                document.getElementById("EntregarAGuarda").style.display = "block";
                document.getElementById("EntregarAlAdmin").style.display = "none";
            }
            function f3SI() {
                document.getElementById("ActualGuarda").style.display = "none";
                document.getElementById("EntregarAGuarda").style.display = "none";
                document.getElementById("EntregarAlAdmin").style.display = "block";
            }
            function f4SI() {
                document.getElementById("ActualGuarda").style.display = "block";
                document.getElementById("EntregarAGuarda").style.display = "none";
                document.getElementById("EntregarAlAdmin").style.display = "none";
            }
            function f5SI() {
                document.getElementById("ActualGuarda").style.display = "block";
                document.getElementById("EntregarAGuarda").style.display = "none";
                document.getElementById("EntregarAlAdmin").style.display = "none";
            }
        </script>
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Espere por favor...</h5>
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="col-lg-12">
                <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                    <strong>El excedente no puede estar vacio. Debe realizar la transferencia nuevamente.</strong>
                </div>
                 <div class="alert alert-danger" id="error2" runat="server" style="margin-top: 10px; display: none">
                    <strong>El valor del excedente actual no pueder ser menor que el ultimo excedente de $<asp:Label ID="lblultiexcedente" runat="server" ></asp:Label>
                    </strong>
                </div>
                <asp:Label ID="lbltransferencia" runat="server" Visible="false"></asp:Label>
                <div class="card" style="border-radius: 7px">
                    <div class="card-header font-weight-bold">
                        Transferencias de Caja Menor
                    </div>
                    <div class="card-body" runat="server">
                        <div class="alert alert-success" id="CMaGuarda" runat="server" style="display: none">
                            <strong>Vigilancia tiene $0 en caja menor</strong>
                        </div>


                        <div id="ActualGuarda" style="display: block">
                            <div id="CMActualGuarda" runat="server" style="display: none">
                                <div class="font-weight-bold">Estado Actual de la Caja</div>
                                <div class="alert alert-light border-danger col-ls-12" runat="server">
                                    <p>
                                        El Guarda
                                    <asp:Label ID="lblUsuarioDestino" CssClass="text-danger" runat="server"></asp:Label>
                                        recibio: $&nbsp;<asp:Label ID="lblCajaMenorGuarda" CssClass="text-danger" runat="server"></asp:Label>
                                        de caja menor y de excedente recibio: $&nbsp;<asp:Label ID="lblExcedenteGuarda" CssClass="text-danger" runat="server"></asp:Label>. Transferencia realizada el dia
                                    <asp:Label ID="lblFechaTransferencia" runat="server"></asp:Label>
                                    </p>
                                    <div class="col-ls-12">
                                        <p class="font-weight-bold">
                                            * Realizar transferencia de Caja a otro:
                                         <button id="f1" onclick="f1SI()" type="button" class="btn btn-success font-weight-bold" style="border-radius: 3px">Guarda</button>
                                        </p>

                                        <br />
                                        <p class="font-weight-bold">
                                            * Realizar transferencia de Caja al:
                                        <button id="f3" onclick="f3SI()" type="button" class="btn btn-danger font-weight-bold" style="border-radius: 3px">Administrador</button>
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div id="EntregarAGuarda" style="display: none;">
                            <p>
                                <button id="f4" onclick="f4SI()" type="button" class="btn btn-info btn-sm font-weight-bold" style="border-radius: 3px">Regresar</button>
                            </p>
                            <div class="font-weight-bold">Seleccione Guarda para Entregar Caja</div>
                            <div class="alert alert-light border-success col-ls-12" runat="server">
                                <div class="col-ls-12">
                                    El Guarda
                                    <asp:Label ID="lblUsuarioDestino2" CssClass="text-success" runat="server"></asp:Label>
                                    entrega al guarda:
                            <asp:DropDownList ID="ddGuarda" runat="server" CssClass="form-control text-uppercase" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Id">
                                <asp:ListItem>Seleccione Guarda...</asp:ListItem>
                            </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParqTbl_CMVigilante] WHERE (([Activo] &lt;&gt; @Activo) AND ([Id] &lt;&gt; @Id))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="False" Name="Activo" Type="Boolean" />
                                            <asp:Parameter DefaultValue="1" Name="Id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-ls-12">
                                    un valor de Caja Menor por:
                                  <asp:TextBox ID="txtcmGuarda" Enabled="false" Text="0" CssClass="form-control font-weight-bold" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-ls-12">
                                    y un excedente de:
                                  <asp:TextBox ID="txtexcedente" TextMode="Number" Text="0" CssClass="form-control font-weight-bold" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-ls-12" style="margin-top: 15px; margin-left: 10px">
                                    <asp:Button ID="btnentrega" runat="server" Text="Entregar" OnClick="btnentrega_Click" class="btn btn-success border border-secondary text-light font-weight-bold"
                                        OnClientClick="return confirm('¿Desea seguir con la transferencia?);" Style="border-radius: 5px" />
                                </div>
                            </div>

                        </div>


                        <div id="EntregarAlAdmin" style="display: none;">
                            <p>
                                <button id="f5" onclick="f5SI()" type="button" class="btn btn-info btn-sm font-weight-bold" style="border-radius: 3px">Regresar</button>
                            </p>
                            <div class="font-weight-bold">Entrega de Caja al Administrador</div>
                            <div class="alert alert-light border-success col-ls-12" runat="server">
                                <div class="col-ls-12">
                                    El Guarda
                                    <asp:Label ID="lblUsuarioDestino3" CssClass="text-success" runat="server"></asp:Label>
                                    entrega al administrador de caja menor:
                                  <asp:TextBox ID="txtcmAdmin" Enabled="false" Text="0" CssClass="form-control font-weight-bold" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-ls-12">
                                    y un excedente de:
                                  <asp:TextBox ID="txtexcedente2" TextMode="Number" Text="0" CssClass="form-control font-weight-bold" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-ls-12" style="margin-top: 15px; margin-left: 10px">
                                    <asp:Button ID="btnEntregaAdmin" runat="server" Text="Entregar" OnClick="btnEntregaAdmin_Click" class="btn btn-success border border-secondary text-light font-weight-bold"
                                        OnClientClick="return confirm('¿Desea seguir con la transferencia?);" Style="border-radius: 5px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </form>
    </div>
</asp:Content>
