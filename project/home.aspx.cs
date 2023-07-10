using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace project
{
    public partial class home : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn1"].ConnectionString);
      
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            if (!IsPostBack)
            {
                for(int i=2020; i>=  1980; i--)
                {
                    DropDownList3.Items.Add(new ListItem(""+i));


                }
                for (int i = 1; i<= 31; i++)
                {
                    DropDownList1.Items.Add(new ListItem("" + i));


                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex =1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Next_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
            
                string ext = Path.GetExtension(FileUpload1.FileName);
                if(ext.ToLower() == ".gif"|| ext.ToLower() == ".png" || ext.ToLower() == ".jpg")
                {
                    int fsize = FileUpload1.PostedFile.ContentLength;
                    if (fsize < 2048576)
                    {
                       Label6.Visible = false;
                          if(DropDownList1.SelectedValue== "day"|| DropDownList2 .SelectedValue== "Month" || DropDownList3.SelectedValue== "year")
                          {
                            Label7.Visible = true;
                            Label7.Text = "Enter Your Birth Date  correctly";
                            MultiView1.ActiveViewIndex = 2;

                        }
                          else
                          {
                            Label7.Visible = false;
                            FileUpload1.SaveAs(Server.MapPath("~/img/" + FileUpload1.FileName));

                            


                            MultiView1.ActiveViewIndex = 3;
                          }
                   
                    }
                    else
                    {
                        Label6.Visible = true;
                        Label6.Text = "the img must be less 2MB";
                    }
                   
                
                }
                else 
                {
                    Label6.Visible = true;
                    Label6.Text = " only  .gif .png .jpg Extention ";
                    MultiView1.ActiveViewIndex = 2;
                }
            }
            else
            {
                
                Label6.Visible = true;
                Label6.Text = "you must upload Img ";
                MultiView1.ActiveViewIndex = 2;

            }
            

        }

        protected void Button_next_Click(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedValue == "degree")
            {
                Label8.Visible = true;
                Label8.Text = "Enter Your Academic degree";
                MultiView1.ActiveViewIndex = 3;

            }
            else
            {
                Label7.Visible = false;
                MultiView1.ActiveViewIndex = 4;
            }
           
        }

        protected void Button_previous_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button2_Next_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }

        protected void Button2_previous_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Button3_previous_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
           

        }

        protected void Button3_Next_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                string ext = Path.GetExtension(FileUpload2.FileName);
                if (ext.ToLower() == ".pdf" || ext.ToLower() == ".docx")
                {
                    int fsize = FileUpload2.PostedFile.ContentLength;
                    if (fsize < 2048576)
                    {
                        string fol = Server.MapPath("~/img/" + FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("~/File/" + FileUpload2.FileName));
                        string cv = Server.MapPath("~/File/" + FileUpload2.FileName);
                        SqlCommand cmd1 = new SqlCommand("addPerson", conn);
                        SqlCommand cmd2 = new SqlCommand("AddEDInfo", conn);
                        SqlCommand cmd3 = new SqlCommand("AddExp", conn);
                        SqlCommand cmd4 = new SqlCommand("addcv", conn);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd3.CommandType = CommandType.StoredProcedure;
                        cmd4.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        cmd1.Parameters.AddWithValue("@FullName", TextBox1.Text.ToString());
                        cmd1.Parameters.AddWithValue("@Email", TextBox2.Text.ToString());
                        cmd1.Parameters.AddWithValue("@Phone", TextBox3.Text.ToString());
                        cmd1.Parameters.AddWithValue("@Address", TextBox4.Text.ToString());
                        string BirthDate = DropDownList3.SelectedValue + "-" + DropDownList2.SelectedValue + "-" + DropDownList1.SelectedValue;
                        cmd1.Parameters.AddWithValue("@BDate", BirthDate);
                        cmd1.Parameters.AddWithValue("@img", fol.ToString());
                      cmd1.ExecuteNonQuery();
                        /*Educational info*/
                        cmd2.Parameters.AddWithValue("@AD", DropDownList4.SelectedValue.ToString());
                        cmd2.Parameters.AddWithValue("@Major", TextBox5.Text.ToString());
                        cmd2.Parameters.AddWithValue("@Uny", TextBox6.Text.ToString());
                        cmd2.Parameters.AddWithValue("@GPA", TextBox7.Text.ToString());
                           cmd2.ExecuteNonQuery();  

                        /*exp*/
                        cmd3.Parameters.AddWithValue("@CompanyName", TextBox8.Text.ToString());
                        cmd3.Parameters.AddWithValue("@Period", TextBox9.Text.ToString());
                        cmd3.Parameters.AddWithValue("@JobPosition", TextBox10.Text.ToString());
                        cmd3.Parameters.AddWithValue("@Salary", TextBox11.Text);
                        cmd3.ExecuteNonQuery();
                        /*CV*/

                        cmd4.Parameters.AddWithValue("@cv", cv.ToString());
                        cmd4.ExecuteNonQuery();
MultiView1.ActiveViewIndex = 6;
                        conn.Close();

                        


                    }
                    else
                    {
                        Label9.Visible = true;
                        Label9.Text = "the img must be less 2MB";

                    }

                }
                else
                {
                    Label9.Visible = true;
                    Label9.Text = " only  .pdf .docx Extention ";
                    MultiView1.ActiveViewIndex = 5;
                }

            }
            else
            {

                Label9.Visible = true; 
                Label9.Text = "you must upload CV ";
                MultiView1.ActiveViewIndex = 5;

            }
          
        }
        protected void SignUP_bot_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Sign_up_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlCommand cmd = new SqlCommand("AddSign",conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.Parameters.AddWithValue("@email", Em.Text.ToString());
                cmd.Parameters.AddWithValue("@pass", Pass.Text.ToString());
                cmd.ExecuteNonQuery();
                conn.Close();
                MultiView1.ActiveViewIndex = 0;
            }
        }
    }
}