<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="DescargarPDFAsamblea.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web148" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
         <div class="container">
                <h3 class="text-center textocolorinfo font-weight-bold">Descargar Documentos</h3>
             <p></p>
        <form id="fo1" runat="server">
            <div class="text-center">
                <img class="mb-4 animate__animated animate__bounceInLeft" src="../Diseño/Imagenes/contrato.png" alt="" width="110" height="110" border="0" />
            </div>
      
            <br />
            <section>
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <div class="card bordercolorinfo" style="border-radius: 5px">
                                <div class="card-body">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-import textocolorinfo bordercolorinfo"></i></div>
                                        <div class="stat-content dib">
                                            <h4 class="stat-text textocolorinfo">Fecha de Carga: &nbsp
                                                <asp:Label ID="label1" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Fecha","{0:d}") %></asp:Label></h4>
                                            <h3 class="stat-text textocolorinfo">Documento: &nbsp
                                                    <asp:Label ID="label4" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Nombre") %></asp:Label></h3>
                                            <p></p>
                                            <div class="row">
                                                <div>
                                                    <i class="fa fa-hand-o-right"></i>
                                                </div>
                                                &nbsp;&nbsp<div class="text-light">
                                                    <a href="DescargaPDF.aspx?Id=<%#Eval("Documento")%>">
                                                        <button class="btn btncolorinfo text-light font-weight-bold" style="border-radius:5px" type="button"><i class="fa fa-download">>> Ver Documento</i></button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
            <br />
            <br />
            <br />
        </form>
    </div> 
</asp:Content>
