<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolMangmentSystem.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .text-center {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div style="background-image:url('../Images/'); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>

            <h3 class="text-center">Add Teacher</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-3">
                <div class="col-md-6"> 
    <label for="txtName">Name</label>
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"  Width="100%" Height="22px" required></asp:TextBox>            
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should Be In Characters " foreColor="red" 
        ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
    </asp:RegularExpressionValidator>
</div>
                <div class="col-md-6">
                    <label for="ddlGender">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender Is Required"
                        ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                    </asp:RequiredFieldValidator>
                </div>

            </div>
                <div class="col-md-6"> 
        <label for="txtMobile">Mobile</label>
        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile NO"  Width="100%" Height="22px" required></asp:TextBox>
    </div>
</div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Teacher"  Width="1530px" OnClick="btnAdd_Click" />
                </div> 
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-3">
    <div class="col-md-6"> 
        <label for="txtEmail">Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" Width="100%" Height="22px" required></asp:TextBox>            
    </div>
                <div class="col-md-6">
                    <label for="txtDoB">Date Of Birth</label>
                    <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="date" required>

                    </asp:TextBox>

                </div>
    <div class="col-md-6"> 
        <label for="txtPassword">Password</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password" Width="100%" Height="22px" required></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPwd" runat="server" 
            ErrorMessage="Password is required" ForeColor="Red" 
            ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="true" />
        <asp:RegularExpressionValidator ID="RegexValidatorPwd" runat="server" 
            ControlToValidate="txtPassword"
            ErrorMessage="Password must be at least 6 characters with at least one letter and one number"
            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"
            Display="Dynamic" ForeColor="Red" />
    </div>
</div>
            <div class="row mb-3 mr-log-5 ml-lg-5 mt-md-5">
                <div class="col-md-12">
                    <label for="txtAdress">Address</label>
                    <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" required/>
                </div>

            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-3">
                <div class="col-md-12">
<asp:GridView 
    ID="GridView1" 
    runat="server"
    EmptyDataText=" NO Record To Display !"
    CssClass="table table-hover table-bordered"
    AutoGenerateColumns="False"
    Width="100%" AllowPagin="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="SubjectId"
    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
    OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating" >
    <Columns>
        <asp:BoundField DataField="Sr.NO" HeaderText="Sr.No">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Class">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassId" 
                    SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control">
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Subejct">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SubjectName") %>' CssClass="form-control"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
<asp:CommandField HeaderText="Operation" CausesValidation="false" ShowEditButton="True">
        <ItemStyle HorizontalAlign="Center" />
        </asp:CommandField>
    </Columns>
     <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
