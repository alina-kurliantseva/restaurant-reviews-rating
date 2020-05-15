<%@ Page Language="C#" AutoEventWireup="true" CodeFile="restaurant-reviews.aspx.cs" Inherits="restaurant_reviews" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alina Kurliantseva | Ottawa Restaurant Reviews</title>
    <link rel='stylesheet' runat="server" href='App_Themes/Style.css' type='text/css' media='all'/>
</head>

<body>
    <h1>Ottawa Restaurant Reviews</h1>
    <div class="profileForm">
        <form runat="server">
            <label for="txtMinRating">Search for restaurants with a rating above:</label>
            <asp:TextBox ID="txtMinRating" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="rngVldRating" runat="server"  Type="Integer" 
                                ErrorMessage="Please enter valid rating." ForeColor="Red" 
                                ControlToValidate="txtMinRating" Display="Dynamic"
                                MaximumValue="5" MinimumValue="0">
            </asp:RangeValidator>
            <asp:RequiredFieldValidator runat="server" ID="rqdvldRating" 
                                        ErrorMessage="Please enter rating." ForeColor="Red"
                                        ControlToValidate="txtMinRating" Display="Dynamic">
            </asp:RequiredFieldValidator>
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="BtnSubmit_Click"/>
            <div runat="server" id="divRestaurantReviews"></div>
        </form>
    </div>
</body>
</html>
