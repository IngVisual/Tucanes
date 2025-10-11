<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="SaldoAdministracion.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web114" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <script>
        function msgok() {
            document.getElementById("msg").style.display = "none";
            document.getElementById("conta").style.display = "block";
        }
    </script>
    <div id="msg">
        <div class="col-lg-6">
            <div class="card" style="border-radius: 7px">
                <div class=" card-body">
                    <div class="alert alert-success">
                        <button id="btnsi" type="button" onclick="msgok()" class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite"><h3><i class="fa fa-hand-o-right">&nbsp;Siguiente</i></h3></button>
                       <p></p>
                            <h7>Cuando realice el pago por PSE, Banco virtual o en Banco presencial
                        NO se verá actualizado de manera AUTOMATICA en la aplicación. Este pago solo se actualiza en la app una vez
                        la administración sube los estados de cuenta en el transcurso del Mes. 
                        <p></p>Es importante verificar mes a mes tu estado de cuenta teniendo en presente la fecha de actualización.
                                    </h7>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="conta" style="display:none">
        <h3 class="text-center textocolorinfo font-weight-bold">Saldos Actualizados con Fecha:&nbsp;&nbsp;</h3>
        <br />
        <h3 class="text-center textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right animate__animated animate__fadeInLeft animate__infinite animate__delay-2s"></i><asp:Label ID="lblfecha" Font-Size="XX-Large" runat="server" Text='<%#Eval("Fecha") %>'></asp:Label></h3>
        <br />
        <form id="form1" runat="server">
            <div>
                <asp:Label ID="lblcodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="lblmensaje" runat="server" Font-Bold="true" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div>   
                </div>
            <div class="col-lg-6 col-md-6">
                <div class="card-header user-header alt bg-success" >
                    <div class="media">
                        <a href="#">
                            <asp:Image ID="Image2" runat="server" CssClass="align-self-center rounded-circle mr-3" Style="width: 85px; height: 85px;" Visible="False" ImageUrl="../Diseño/imagenes/pulgares-arriba.png" />
                            <asp:Image ID="Image4" runat="server" CssClass="align-self-center rounded-circle mr-3" Style="width: 85px; height: 85px;" Visible="False" ImageUrl="../Diseño/imagenes/triste.png" />
                            <asp:Image ID="Image3" runat="server" CssClass="align-self-center rounded-circle mr-3" Style="width: 85px; height: 85px;" Visible="False" ImageUrl="../Diseño/imagenes/suspiro (1).png" />
                        </a>
                        <div class="media-body">
                            <h2 class="text-light display-6">
                                <asp:Label ID="lblbien" runat="server" Font-Size="Large" Font-Bold="true" Text="Felicitaciones por tu Saldo" Visible="False"></asp:Label></h2>
                            <h2 class="text-light display-6">
                                <asp:Label ID="lblmedio" runat="server" Font-Size="Large" Font-Bold="true" Text="Bien Hecho, Tu Saldo esta en el promedio" Visible="False"></asp:Label></h2>
                            <h2 class="text-light display-6">
                                <asp:Label ID="lblmalo" runat="server" Font-Size="Large" Font-Bold="true" Text="Te encuentras en Mora, comunicate con Adm." Visible="False"></asp:Label></h2>
                        </div>
                    </div>
                </div>
                <div class="card bordercolorinfo" style="border-radius:7px">
                   <br />
                    <div class=" card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <h4>Saldo Total a Pagar:</h4>
                                <div class="stat-digit">$&nbsp;
                                    <asp:Label ID="lbltotal1" Font-Bold="true" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class=" card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-face-smile text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <h4>Saldo a Favor:</h4>
                                <div class="stat-digit">$&nbsp;
                                    <asp:Label ID="lblfavor" Font-Bold="true" runat="server" ForeColor="Green" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             <div class="col-lg-6">
                 <div class="card bordercolorinfo" style="border-radius: 7px">
                     <div class=" card-body">                        
                    <h7><strong><i class="fa fa-building"><asp:Label ID="lblmsg" runat="server" Text=""></asp:Label></i></strong></h7>                                
                     </div>
                 </div>   
             </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-xs-3">
                        <a href="https://web-conjuntos.jelpit.com/zona-publica-pagos">
                            <button id="btn" type="button" style="border-radius:7px" class="btncolorinfo font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite animate__delay-2s">
                                <i class="fa fa-hand-o-right"></i>&nbsp;Pagar Administración</button></a>
   <p></p>
                    </div>
                    <div class="col-xs-3">
                        <a href="SaldoNotificacion.aspx">
                            <button id="btn1" type="button" style="border-radius:7px" class="btncolorinfo font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite animate__delay-2s">
                                <i class="fa fa-hand-o-right"></i>&nbsp;$ Valores Administracion</button></a>
                    </div>
                </div>
                       <br />
            </div>
            </div>
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-12 col-md-6">
                                    <section class="card bordercolorinfo" style="border-radius:7px">
                                        <div class="card-header user-header alt bgcolor">

                                        </div>
                                        <ul class="list-group ">
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-building"></i>Administracion:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="badge badge-danger pull-right r-activity right-panel">$&nbsp;
                                                        <asp:Label ID="lbladmi"
                                                            runat="server"
                                                            Text='<%#Eval("Admi") %>'>
                                                        </asp:Label></span></a>
                                            </li>
                                                                                        <li class="list-group-item">
                                                <a href="#"><i class="fa fa-building">Intereses:</i> <span class="badge badge-danger pull-right r-activity">$&nbsp;
                                                        <asp:Label ID="Label1"
                                                            runat="server"
                                                            Text='<%#Eval("Favor") %>'>
                                                        </asp:Label></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-building">Deposito:</i> <span class="badge badge-danger pull-right r-activity">$&nbsp;
                                                        <asp:Label ID="lblintereses"
                                                            runat="server"
                                                            Text='<%#Eval("Inter") %>'>
                                                        </asp:Label></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-building"></i>Parqueaderos: <span class="badge badge-danger pull-right r-activity">$&nbsp;
                                                        <asp:Label ID="lblmulta"
                                                            runat="server"
                                                            Text='<%#Eval("Sancion") %>'>
                                                        </asp:Label></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-building"></i>Sanciones:<span class="badge badge-danger pull-right r-activity">$&nbsp;
                                                        <asp:Label ID="lblmoto"
                                                            runat="server"
                                                            Text='<%#Eval("Moto") %>'>
                                                        </asp:Label></span></a>
                                            </li>
                                            </li>
                                                                        <li class="list-group-item">
                                                                            <a href="#"><i class="fa fa-building"></i>Extraordinaria: <span class="badge badge-danger pull-right r-activity">$&nbsp;
                                                                                <asp:Label ID="lblCarro"
                                                                                    runat="server"
                                                                                    Text='<%#Eval("Carro") %>'>
                                                                                </asp:Label></span></a>
                                                                        </li>

                                        </ul>

                                    </section>
                                </div>

                            </ItemTemplate>
                            <SeparatorTemplate>
                                <asp:Image ID="Image1"
                                    ImageUrl="~/Propietario/images/Nuevo proyecto (74).png"
                                    runat="server" />
                            </SeparatorTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
            <br />
            <div>
            </div>
            <br />           
            <br />
        </form>
    </div>
</asp:Content>
