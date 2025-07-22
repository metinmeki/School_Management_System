<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolMangmentSystem.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
                        <asp:ListItem Text="Select Class" Value="" />
                              <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name"  Width="100%" Height="22px" required></asp:TextBox>            
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should Be In Characters " foreColor="red" 
                        ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">

                    </asp:RegularExpressionValidator>
                </div>

                <div class="col-md-6"> 
                    <label for="txtDoB">Date Of Birth</label>
                    <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date"  Width="100%" Height="22px" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-3">
    <div class="col-md-6"> 
        <label for="txtName">Name</label>
            <asp:ListItem Text="Select Class" Value="" />
                  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter Name"  Width="100%" Height="22px" required></asp:TextBox>            
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name Should Be In Characters " foreColor="red" 
            ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">

        </asp:RegularExpressionValidator>
    </div>

    <div class="col-md-6"> 
        <label for="txtDoB">Date Of Birth</label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Date"  Width="100%" Height="22px" required></asp:TextBox>
    </div>
</div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Subject" OnClick="btnAdd_Click" Width="1530px" />
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
