<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolMangmentSystem.Admin.AddClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url('../Images/'); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Class Name </h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt--md-5">
                <div class="col-md-6"> 
                    <label for="txtClass">Class Name</label>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class Name" required></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Class" OnClick="btnAdd_Click1" Height="29px"/>
                </div> 
            </div>
        </div>
    </div>

</asp:Content>



<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <style type="text/css">
        .btn-block {}
    </style>
</asp:Content>




