<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tableviewEditor.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis.tableviewEditor" %>
<%@ Register Assembly="JDash.WebForms" Namespace="JDash.WebForms" TagPrefix="jdash" %>
<link href="/jdash/dashlets/Dataanalysis/Resource/DataAnalysisStyles.css" rel="stylesheet" />
<div class="form">

    <div class="item">
        <span>
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Global, Title%>"></asp:Literal></span>
        <jdash:DashletTitleEditor CssClass="form-control" ID="ctlTitle" runat="server"></jdash:DashletTitleEditor>
    </div>

    <div class="itemGroup">
        <div class="item">
            <span>
                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Global, Style%>"></asp:Literal></span>
            <jdash:DashletStylesList ID="ctlStyle" runat="server"></jdash:DashletStylesList>
        </div>
        <div class="item" style="float: right">
            <span>
                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Global, CssClass%>"></asp:Literal></span>
            <jdash:DashletCssEditor CssClass="form-control" ID="ctlCss" runat="server"></jdash:DashletCssEditor>
        </div>
        <div class="caption">
            <b>
                <asp:Label ID="ctlStepCaption" runat="server" Text="<%$ Resources:Global, TableDataDashletStep1%>"></asp:Label></b>
        </div>
    </div>

    <div class="wizard">
        <asp:Panel runat="server" Visible="true" ID="ctlStep1" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="ctlStep1Desc" runat="server" Text="<%$ Resources:Global, TableDataDashletStep1Desc%>"></asp:Literal>
            </div>
            <span>
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Global, SelectCube%>"></asp:Literal></span>
            <asp:DropDownList CssClass="form-control" runat="server" ID="ctlCube" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="ctlCube_SelectedIndexChanged"></asp:DropDownList>

        </asp:Panel>
        <asp:Panel runat="server" ID="ctlStep2" Visible="false">
            <div class="alert alert-info">
                <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Global, TableDataDashletStep2Desc%>"></asp:Literal>
            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Global, SelectMetrics%>"></asp:Literal></span>
            </div>
            <div class="itemGroup">
                <div class="item">
                    <span>
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Global, FirstMetric%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlFirstMetric" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>

                </div>

                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Global, SecondMetricOptional%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSecondMetric" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>

                </div>

            </div>

        </asp:Panel>
        <asp:Panel runat="server" ID="ctlStep3" Visible="false">
            <div class="alert alert-info">
                <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Global, TableDataDashletStep3Desc%>"></asp:Literal>
            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Global, SelectDimensions%>"></asp:Literal></span>
            </div>
            <div class="itemGroup">
                <div class="item">
                    <span>
                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Global, FirstDimension%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlFirstDimension" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>
                </div>
                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Global, SecondDimensionOptional%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSecondDimension" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>

                </div>

            </div>

        </asp:Panel>
        <asp:Panel ID="ctlStep4" Visible="false" runat="server">
            <div class="alert alert-info">
                <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:Global, TableDataDashletStep4Desc%>"></asp:Literal>
            </div>
            <div class="itemGroup">
                <div class="item">
                    <span>
                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Global, SortBy%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSort" DataTextField="Value" DataValueField="Key"></asp:DropDownList>

                </div>
                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Global, SortDir%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSortDir"></asp:DropDownList>
                </div>

            </div>

            <div class="itemGroup">
                <div class="item">
                    <span>
                        <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Global, SortThenBy%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSecondSort" DataTextField="Value" DataValueField="Key"></asp:DropDownList>

                </div>
                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Global, SortDir%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSecondSortDir"></asp:DropDownList>
                </div>

            </div>

            <div class="itemGroup">
                <div class="item">
                    <span>
                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Global, LimtDataBy%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlTake"></asp:DropDownList>

                </div>
                <div class="item right-control">
                </div>

            </div>

        </asp:Panel>
    </div>
    <div class="wizardPager">
        <div class="stepCounter">
            <asp:Button ID="ctlPrevButton" Style="visibility: hidden" runat="server" Text="<%$ Resources:Global, PreviousStep%>" OnClick="ctlPrevButton_Click" CssClass="pagerbtn pagerprevious" />
            <asp:Label ID="ctlStepCounter" Text="1 / 5" runat="server" CssClass="pagenumber"></asp:Label>
            <asp:Button ID="ctlNextButton" runat="server" Text="<%$ Resources:Global, NextStep%>" OnClick="ctlNextButton_Click" CssClass="pagerbtn pagernext" />
        </div>
    </div>
</div>

