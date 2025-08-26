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
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" 
    Width="100%" MaxLength="50"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
    ControlToValidate="txtName"
    ErrorMessage="Name is required"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true">
</asp:RequiredFieldValidator>

<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
    ControlToValidate="txtName"
    ErrorMessage="Name should contain only letters"
    ForeColor="Red" Display="Dynamic"
    SetFocusOnError="true"
    ValidationExpression="^[A-Za-z\s]+$">
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
    Width="100%" AllowPagin="True" PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames=""
    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
    OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" >
    <Columns>
        <asp:BoundField DataField="Sr.NO" HeaderText="Sr.No">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Name">
            <EditItemTemplate>
                <asp:Label ID="txtName" runat="server" Text='<%# Eval("Name") %>'
                    Width="100px"></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>

                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mobile">
            <EditItemTemplate>

                <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control"
                    Width="100px"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
            </ItemTemplate>

            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
    <ItemTemplate>
        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
    </ItemTemplate>

    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
        <asp:TemplateField HeaderText="Password">
    <EditItemTemplate>
        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control"
            Width="100px"></asp:TextBox>
    </EditItemTemplate>

    <ItemTemplate>
        <asp:Label ID="lblPassworde" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
    <EditItemTemplate>

        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control"
            Width="100px"></asp:TextBox>
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
    </ItemTemplate>

    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:CommandField HeaderText="Operation" CausesValidation="false" ShowEditButton="True" ShowDeleteButton="true">
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
