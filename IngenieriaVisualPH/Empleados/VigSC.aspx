<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="VigSC.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: #134E5E; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #71B280, #134E5E); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #71B280, #134E5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
    <div id="procesando" class="ventana" style="display: none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando .....</h5>
    </div>
    <form id="form" runat="server">
                    <div id="programacion" runat="server">
                    <h3 class="font-weight-bold text-capitalize text-light text-center">PROGRAMACIÓN SALON COMUNAL</h3>
                    <p></p>
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-6 col-md-6">
                                <div class="card" style="border-radius:5px">
                                    <div class="card-body">
                                        <div class="stat-widget-one">
                                                <div class="stat-digit">&nbsp;&nbsp<h5 class="text-primary font-weight-bold">Vivienda: &nbsp;&nbsp
                                                    <asp:Label ID="label2" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Codigo") %></asp:Label></h5>
                                                <h5 class="stat-text text-success">Fecha del Evento:
                                                    <asp:Label ID="label1" Font-Size="Small" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Fecha","{0:d}") %></asp:Label></h5>
                                                 <h5 class="stat-text text-success">Nombre del Encargado:
                                                    <asp:Label ID="label6" Font-Size="Small" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Nombre") %></asp:Label></h5>                                                
                                                 <h5 class="stat-text text-success"> Observacion del Evento: &nbsp;&nbsp
                                                    <asp:Label ID="label5" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Observacion") %></asp:Label></h5>
                                                 <h5 class="stat-text text-success"> Respuesta de Admnistracion: &nbsp;&nbsp
                                                    <asp:Label ID="label4" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Respuesta") %></asp:Label></h5>
                                                </div>
                                                <div class="row">
                                                    <div>
                                                <i class="fa fa-truck"></i></div>&nbsp;&nbsp<div class="text-light">
                                                    <asp:Label ID="label3" runat="server" BackColor="#3366cc" Font-Size="Smaller" CssClass="text-light font-weight-bold form-control"><%#Eval("SalCom") %></asp:Label>                                                                                               </div>
                                                </div>
                                                <p></p>
                                                <div class="col-sm3 ">
                                                <a href="VigSCEditar.aspx?Id=<%#Eval("Id")%>">
                                               <button class="btn-block btn-lg btn-success font-weight-bold pull-right" style="border-radius:5px" type="button" title="Actualizar"><i class=" fa fa-edit">&nbsp;&nbsp;Editar</i></button>
                                             </a>
                                           </div>
                                        </div>
                                    </div>                                
                                </div>
                            </div>
                          </div>
                        </ItemTemplate>
                    </asp:Repeater>
                <br />
                <br />
                <br />
                <br />
                </div>
        </form>
</asp:Content>
