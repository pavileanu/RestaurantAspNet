using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Request.Params["id"] != null)
        {
            try
            {
                int id = Convert.ToInt32(Request.Params["id"]);
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
                con.Open();
                string cmd_string = "SELECT NUME,LOCATIE FROM RESTAURANT WHERE ID_RESTAURANT = @ID ";
                SqlCommand cmd = new SqlCommand(cmd_string, con);
                cmd.Parameters.AddWithValue("ID", id);

                try
                {
                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                    {
                        Label1.Text = r["NUME"].ToString();
                        Label2.Text = r["LOCATIE"].ToString();
                    }

                }
                catch (Exception ex)
                {
                    Raspuns.Text = " Eroare la inserare : " + ex.Message;
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Raspuns.Text = " Eroare la conexiune sau conversia datelor : " + ex.Message;
            }
        }
    }
    protected void Delete1(object sender, EventArgs e)
    {


        try
        {
            int id = Convert.ToInt32(Request.Params["id"]);
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            string cmd_string = "DELETE FROM [RESTAURANT] WHERE [ID_RESTAURANT] = @ID_RESTAURANT";
            SqlCommand cmd = new SqlCommand(cmd_string, con);

            cmd.Parameters.AddWithValue("@ID_RESTAURANT", id);

            try
            {
                cmd.ExecuteNonQuery();
                Session["Message"] = "Datele au fost sterse!";
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {
                Raspuns.Text = " Eroare la stergere : " + ex.Message;
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Raspuns.Text = " Eroare la conexiune sau conversia datelor : " + ex.Message;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}