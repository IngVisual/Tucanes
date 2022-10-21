<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="SaldoNotificacion.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web115" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
 <link href="../Diseño/Color.css" rel="stylesheet" />
    <form id="form" runat="server">
                <table>
                <tr>
                    <td>
                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="card" style="border-radius:7px">
                                        <div class="card-header">
                                            <strong class="card-title text-success font-weight-bold">Observaciones <small><span class="badge badge-success float-right mt-1">Importante</span></small></strong>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text text-dark font-weight-bold ">
                                                <asp:Label ID="lbladmi" runat="server" Text='<%#Eval("Msg") %>'></asp:Label></p>
                                        </div>
                                    </div>
                                </div>
                              <br />
                            </ItemTemplate>
                        </asp:Repeater>


                        <asp:Repeater ID="r2" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-3 col-md-6">
                                    <div class="card" style="border-radius:7px">
                                        <div class="card-body">
                                            <div class="stat-widget-four">
                                                <div class="stat-icon dib">
                                                    <i class="ti-money text-muted text-dark"></i>
                                                </div>
                                                <div class="stat-content">
                                                    <div class="text-left dib">
                                                        <div class="stat-heading text-dark font-weight-bold"><asp:Label ID="Label5" runat="server" Text='<%#Eval("Administracion") %>'></asp:Label>
                                                        <div class="stat-text text-success font-weight-bold">$&nbsp
                                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("ValorAdm") %>'></asp:Label></div>
                                                            <br />
                                                            <div class="stat-heading text-secondary font-weight-bold"><asp:Label ID="Label4" runat="server" Text='<%#Eval("Descuento") %>'></asp:Label>
                                                   <div class="stat-text stat-text text-primary font-weight-bold">$&nbsp
                                                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("ValorDesc") %>'></asp:Label></div>
                                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                            </ItemTemplate>
                            <SeparatorTemplate>

                            </SeparatorTemplate>
                        </asp:Repeater>

                          <asp:Repeater ID="r3" runat="server">
                            <ItemTemplate>
                                <div class="card col-lg-2 col-md-6 no-padding bg-flat-color-1 " style="border-radius:7px">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-car text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="text-light font-weight-bold">
                                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("Parqueadero") %>'></asp:Label></span>
                                        </div>
                                        <h3 class="text-uppercase text-light font-weight-bold">$&nbsp
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Valor") %>'></asp:Label></h3>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SeparatorTemplate>

                            </SeparatorTemplate>
                        </asp:Repeater>

                         <asp:Repeater ID="r4" runat="server">
                            <ItemTemplate>
                                <div class="card col-lg-2 col-md-6 no-padding bg-flat-color-5 " style="border-radius:7px">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-building text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="text-light font-weight-bold">
                                            <asp:Label ID="Label16" runat="server" Text='<%#Eval("SalCom") %>'></asp:Label></span>
                                        </div>
                                        <h3 class="text-uppercase text-light font-weight-bold">$&nbsp
                                            <asp:Label ID="Label11" runat="server" Text='<%#Eval("ValorSC") %>'></asp:Label></h3>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SeparatorTemplate>

                            </SeparatorTemplate>
                        </asp:Repeater>

                         <asp:Repeater ID="r5" runat="server">
                            <ItemTemplate>
                                <div class="card col-lg-2 col-md-6 no-padding bg-flat-color-4 " style="border-radius:7px">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bullseye text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="text-light font-weight-bold">
                                            <asp:Label ID="Label26" runat="server" Text='<%#Eval("Chip") %>'></asp:Label></span>
                                        </div>
                                        <h3 class="text-uppercase text-light font-weight-bold">$&nbsp
                                            <asp:Label ID="Label21" runat="server" Text='<%#Eval("ValorChip") %>'></asp:Label></h3>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <SeparatorTemplate>

                            </SeparatorTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </form>
</asp:Content>
