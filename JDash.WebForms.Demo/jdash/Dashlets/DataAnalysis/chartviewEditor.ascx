<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chartviewEditor.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.DataAnalysis.chartviewEditor" %>
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
                <asp:Label ID="ctlStepCaption" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep1%>"></asp:Label></b>
        </div>
    </div>

    <div class="wizard">
        <asp:Panel runat="server" Visible="true" ID="ctlStep1" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep1Desc%>"></asp:Literal>
            </div>
            <div class="itemGroup">
                <div class="">
                    <span>
                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Global, SelectCube%>"></asp:Literal></span>
                    <asp:DropDownList runat="server" ID="ctlCube" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="ctlCube_SelectedIndexChanged" CssClass="cubecombo form-control"></asp:DropDownList>
                </div>

            </div>

        </asp:Panel>
        <asp:Panel runat="server" Visible="false" ID="ctlStep2" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep2Desc%>"></asp:Literal>
            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Global, SelectMetric%>"></asp:Literal></span>
                <asp:DropDownList CssClass="form-control" runat="server" ID="ctlFirstMetric" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>

            </div>

        </asp:Panel>
        <asp:Panel runat="server" Visible="false" ID="ctlStep3" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep3Desc%>"></asp:Literal>
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

            <div class="itemGroup">

                <div class="item">
                    <span>
                        <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Global, PivotData%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlPivotDimension" DataTextField="Caption" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="RebuildSortColumns"></asp:DropDownList>
                </div>

                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Global, SortBy%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ctlSort" DataTextField="Value" DataValueField="Key"></asp:DropDownList>
                </div>

            </div>

        </asp:Panel>
        <asp:Panel runat="server" Visible="false" ID="ctlStep4" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep4Desc%>"></asp:Literal>
            </div>
            <div class="itemGroup">

                <div class="item">
                    <span>
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Global, ChartHeight%>"></asp:Literal></span>
                    <asp:TextBox runat="server" ID="ctlHeight" CssClass="textbox-halfwidth form-control"></asp:TextBox>
                </div>

                <div class="item right-control">
                    <span>
                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Global, ChartTheme%>"></asp:Literal></span>
                    <asp:DropDownList CssClass="form-control" runat="server" DataTextField="Value" DataValueField="Key" ID="ctlTheme"></asp:DropDownList>

                </div>


            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Global, SelectChartType%>"></asp:Literal></span>
                <div class="chart-item"><img src="/jdash/Dashlets/Dataanalysis/Resource/img/piechart.png"  /></div>
                <div class="chart-item"><img src="/jdash/Dashlets/Dataanalysis/Resource/img/columnchart.png"  /></div>
                <div class="chart-item"><img src="/jdash/Dashlets/Dataanalysis/Resource/img/barchart.png"  /></div>
                <div class="chart-item"><img src="/jdash/Dashlets/Dataanalysis/Resource/img/linechart.png"  /></div>
               <div class="chart-item"> <img src="/jdash/Dashlets/Dataanalysis/Resource/img/areachart.png" /></div>
                <asp:RadioButtonList ID="ctlChartTypes" runat="server" RepeatDirection="Horizontal" CellSpacing="30" CssClass="chart-text">
                    <asp:ListItem Value="Pie" Text="<%$ Resources:Global, Pie%>" Selected="True" ></asp:ListItem>
                    <asp:ListItem Value="Column" Text="<%$ Resources:Global, Column%>" ></asp:ListItem>
                    <asp:ListItem Value="Bar" Text="<%$ Resources:Global, Bar%>" ></asp:ListItem>
                    <asp:ListItem Value="Line" Text="<%$ Resources:Global, Line%>" ></asp:ListItem>
                    <asp:ListItem Value="Area" Text="<%$ Resources:Global, Area%>" ></asp:ListItem>
                </asp:RadioButtonList>
            </div>

        </asp:Panel>
        <asp:Panel runat="server" Visible="false" ID="ctlStep5" class="item steps">
            <div class="alert alert-info">
                <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:Global, ChartDataDashletStep5Desc%>"></asp:Literal>
            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Global, HeaderText%>"></asp:Literal></span>
                <asp:TextBox runat="server" ID="ctlHeader" CssClass="textbox-fullwidth form-control"></asp:TextBox>
            </div>
            <div class="item">
                <span>
                    <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Global, FooterText%>"></asp:Literal></span>
                <asp:TextBox runat="server" ID="ctlFooter" CssClass="textbox-fullwidth form-control"></asp:TextBox>
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

