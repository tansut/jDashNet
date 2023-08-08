<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.Jdash.Dashlets.MsChart.View" %>

<style type="text/css">
    .msChart .d-dashlet-content
    {
        text-align: center;
        padding:0px;
    }

    .msChart label
    {
        display:inline;
        margin-bottom:0px;
    }
</style>



<asp:Label ID="ctlDesc" runat="server" CssClass="widget-description"></asp:Label>


    <asp:Chart ID="chr" runat="server" ImageStorageMode="UseImageLocation">
        <Titles>
            <asp:Title Name="chartTitle" Font="Arial, 14pt" ShadowOffset="0" />
        </Titles>
        <Legends>
            <asp:Legend Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8pt, style=Bold">
            </asp:Legend>
        </Legends>
        <BorderSkin SkinStyle="None"></BorderSkin>
        <Series>
            <asp:Series ToolTip="This is a #VALX{dddd}" XValueType="DateTime" Name="Default">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BackColor="64, 165, 191, 228" ShadowColor="Transparent"
                BackSecondaryColor="Transparent">
                <Area3DStyle Rotation="10" Perspective="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                    WallWidth="0" IsClustered="False" LightStyle="Simplistic" />
                <AxisY LineColor="64, 64, 64, 64" IsLabelAutoFit="False">
                    <LabelStyle Font="Trebuchet MS, 8pt" />
                    <MajorGrid LineColor="64, 64, 64, 64" />
                </AxisY>
                <AxisX LineColor="64, 64, 64, 64">
                    <LabelStyle Font="Trebuchet MS, 8pt" />
                    <MajorGrid LineColor="64, 64, 64, 64" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>



