<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JDash.WebForms.Demo.JDash.Dashlets.HeatMap.View" %>

<style type="text/css">
    .googleMapVis .d-dashlet-content {
        position: relative;
        padding: 0px;
    }

    .googleMapVis .mask {
        position: absolute;
        background-color: red;
        width: 100%;
        height: 100%;
        z-index: 99;
    }

    .googleMapVis .mapContainer {
        width: 100%;
        height: 100%;
    }



    .googleMapVis .msg {
        position: absolute;
        font-size: 30px;
        font-family: sans-serif;
        text-shadow: 0.1em 0.1em 0.2em black;
        text-align: center;
        width:100%;
        margin-top:50px;

    }

    .googleMapVis .lightbox {
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: #ffffff;
        opacity: 0.2;
        z-index:99;
        top:0px;
    }
    .year {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 30px;
      font-family: sans-serif;
      text-shadow: 0.1em 0.1em 0.2em black;
      color: white;
      z-index:150;
    }
</style>
