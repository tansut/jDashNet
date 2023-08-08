<%@ Page Title="" Language="C#" MasterPageFile="~/Demo.Master" AutoEventWireup="true" CodeBehind="ConfigDB.aspx.cs" Inherits="JDash.WebForms.Demo.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ctlHeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageContent" runat="server">
    <div class="container" style="margin-top: 30px;" >
    <div >
    <h2>First time running demo application ?</h2>
    <h4>That's OK. It will only take 10 seconds to configure your database. Let's start.</h4>

    </div>
    
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Using Microsoft SQL Server ?</h3>
                </div>
                <div class="panel-body">
                    <img src="/Resource/img/SQL-Server-logo.png" />
                    <ol>
                        <li>Create a new empty database.
                        </li>
                        <li>Open web.config file, locate <strong>SqlConstr</strong> connection string. Configure it.
            <pre>
&lt;add name=&quot;SqlConstr&quot; connectionString=&quot;Data Source=[YOUR SQL SERVER];Initial Catalog=[YOUR DATABASE];User ID=[USERNAME];Password=[PASSWORD]&quot; providerName=&quot;System.Data.SqlClient&quot;&gt;&lt;/add&gt;
            </pre>
                        </li>
                        <li>Re-run your project.
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
<div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Using MySQL ?</h3>
                </div>
                <div class="panel-body">
                    <img src="/Resource/img/mysql-logo.jpg" />
                    <ol>
                        <li>Create a new empty database.
                        </li>
                        <li>Open web.config file, locate <strong>mySqlConstr</strong> connection string. Configure it.
            <pre>
&lt;add name=&quot;mySqlConstr&quot; connectionString=&quot;Server=[YOUR SERVER];Uid=[USERNAME];Pwd=[PASSWORD];Database=[YOUR DATABASE];&quot; providerName=&quot;System.Data.SqlClient&quot;&gt;&lt;/add&gt;
            </pre>
                        </li>
                        <li>
                            Locate JDash section inside web.config file. Set default provider to MySQL as below.
                            <pre>
&lt;JDash defaultProvider=&quot;<strong>MySQLDashboardProvider</strong>&quot;...
                            </pre>
                        </li>
                        <li>Re-run your project.
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>




    <h2>Here is the exception message:</h2>
    <br />

    <p>
        <asp:literal ID="errorMessage" runat="server"></asp:literal>
    </p>


</div>

</asp:Content>
