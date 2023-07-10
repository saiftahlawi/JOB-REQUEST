<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="project.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet"/>

     <link rel="stylesheet" href="~/assest/style.css"/>
    <title>The Hope International Company</title>
     
</head>
<body>
 
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1"  runat="server" >
                   <header class="header">
                       <div class="logo-box">
    <img src="../assest/img/logo.png" alt="Logo" class="logo"/>
    </div>
                     <div class="text-box">
         <h1 class="heading-primary">
<span class="heading-primary-main">The Hope</span>
<span class="heading-primary-sub">is an International Company</span>
    </h1>  
                         
  <asp:Button ID="Button1" runat="server" Text="sign up " OnClick="Button1_Click" CssClass="btn btn-white btn-animatd" />
  <asp:Button ID="Button2" runat="server" Text="Apply for a job" OnClick="Button2_Click" CssClass="btn btn-white btn-animatd" />
    </div>
                   

                   </header>
                </asp:View> 

                <asp:View ID="View2" runat="server">
                   
                       <div class="wrapper">
	<div class="container">
		<h1>Welcome</h1>
		
		<div class="form">
			<asp:TextBox ID="Em" placeholder="Email" runat="server" ViewStateMode="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter your email" Display="Dynamic" ControlToValidate="Em"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic"  runat="server" ErrorMessage="Invalid Email" ControlToValidate="Em" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
			<asp:TextBox ID="Pass" placeholder="Password" runat="server" TextMode="Password" ViewStateMode="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter the Password" Display="Dynamic" ControlToValidate="Pass" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" Password is Weak" Display="Dynamic" ControlToValidate="Pass"  ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8}$"  ></asp:RegularExpressionValidator>
			<asp:Button ID="Sign_up" runat="server" class="btn_signup" Text="Sign Up" OnClick="Sign_up_Click" />
		</div>
	</div>
	
	
</div>
                   
                </asp:View>

                 <asp:View ID="View3" runat="server">
                         <div class="wrapper">
	<div class="container container1">
		<h1>Personal Information</h1>
        <asp:Label ID="Label6" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
         <asp:Label ID="Label7" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
		<div class="form">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Full  Name" class="upload" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Inter your Full Name" Display="Dynamic" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
           <asp:TextBox ID="TextBox2" runat="server" placeholder="Email" class="upload" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please enter your email" Display="Dynamic" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic"  runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
            <asp:TextBox ID="TextBox3" runat="server" type="tel"  name="phone" placeholder="Phone Number" class="upload" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please enter your Phone number" Display="Dynamic" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Address" class="upload" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="please enter your Address" Display="Dynamic" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
             <div>
            <asp:Label ID="Label1" runat="server" >Your Birth Date:</asp:Label>
                <br />
             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="drop">

                  <asp:ListItem>day</asp:ListItem>
            



            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="drop">


                <asp:ListItem>Month</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>


            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" CssClass="drop">
                

                <asp:ListItem>year</asp:ListItem>
                


            </asp:DropDownList>
                </div>
            <br />
            <div>
                <asp:Label ID="Label2" runat="server" >Image Upload :</asp:Label>
                <br />

  <asp:FileUpload ID="FileUpload1" runat="server" CssClass="upload ds" />
                <br />
          
            </div>
          
            <br />
            <asp:Button ID="SignUP_bot" runat="server" Text="Sign Up" CssClass="bot2" OnClick="SignUP_bot_Click"/>
             <asp:Button ID="Next" runat="server" Text="Next"  CssClass="btn_signup x upload bot2"   OnClick="Next_Click" />
		</div>
	</div>
	
	
</div>
        
	    
                </asp:View>




                 <asp:View ID="View4" runat="server">
                   
                       <div class="wrapper">
	<div class="container">
		<h1>Educational Information</h1>
		<asp:Label ID="Label8" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
		<div class="form">
            <div>
            <asp:Label ID="Label3" runat="server" >Academic degree:</asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="dwn upload">
                
                    <asp:ListItem>degree</asp:ListItem>
                      <asp:ListItem> bachelor's</asp:ListItem>
                      <asp:ListItem>master's </asp:ListItem>
                      <asp:ListItem>doctorates</asp:ListItem>
                </asp:DropDownList>
                </div>
                <br />
			<asp:TextBox ID="TextBox5" runat="server" placeholder="Major" class="upload"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="please enter your Major" Display="Dynamic" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
			<asp:TextBox ID="TextBox6" runat="server" placeholder="univarsity" class="upload"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="please enter your univarsity" Display="Dynamic" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>

            <asp:TextBox ID="TextBox7" runat="server" placeholder="GPA" class="upload" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="please enter your GPA" Display="Dynamic" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button_previous" runat="server" Text="previous" CssClass="bot2" OnClick="Button_previous_Click"/>
            <asp:Button ID="Button_next" runat="server" Text="Next" CssClass="bot2" OnClick="Button_next_Click"/>
            
		</div>
	</div>
	
	
</div>
                   
                </asp:View>
                <asp:View ID="View5" runat="server">

   <div class="wrapper">
	<div class="container">
		<h1>Experience</h1>
		
		<div class="form">
			<asp:TextBox ID="TextBox8" runat="server" placeholder="Company Name" class="upload"></asp:TextBox>
			<asp:TextBox ID="TextBox9" runat="server" placeholder="period" class="upload"></asp:TextBox>
           <asp:TextBox ID="TextBox10" runat="server" placeholder="job position" class="upload"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="Salary"></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server"  class="upload"  TextMode="Number"></asp:TextBox>
            <br />
            <asp:Button ID="Button2_previous" runat="server" Text="previous" CssClass="bot2" OnClick="Button2_previous_Click"/>
            <asp:Button ID="Button2_Next" runat="server" Text="Next" CssClass="bot2" OnClick="Button2_Next_Click" />
            
		</div>
	</div>
	
	
</div>

                </asp:View>
     <asp:View ID="View6" runat="server">

   <div class="wrapper">
	<div class="container">
		<h1>CV</h1>
		 <asp:Label ID="Label9" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
		<div class="form">
			     <div>
                <asp:Label ID="Label5" runat="server" >CV  Upload :</asp:Label>

                <br /><br />
  <asp:FileUpload ID="FileUpload2" runat="server" CssClass="upload" />
                <br />
           
            </div>
              <br />
            <asp:Button ID="Button3_previous" runat="server" Text="previous" CssClass="bot2" OnClick="Button3_previous_Click" />
            <asp:Button ID="Button3_Next" runat="server" Text="submit" CssClass="bot2" OnClick="Button3_Next_Click" />
            
		</div>
	</div>
	
	
</div>

                </asp:View>
                <asp:View ID="View7" runat="server">
                      <div class="wrapper">
	<div class="container">
		<h1 >Thank you. We will contact you soon (:</h1>
		
		
	</div>
	
	
</div>
                </asp:View>
            </asp:MultiView>
      
         
        </div>

    </form>
</body>
</html>
