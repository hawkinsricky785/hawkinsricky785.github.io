using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.UI.HtmlControls;
public partial class webpages_LSPM_Summary_Default : System.Web.UI.Page
{
    private SqlConnection conn = new SqlConnection("Server=tcp:lscresearch.database.windows.net,1433;Database=LSC_Research;User Id=LSAdministrator;Password=LSCResearch17!;Encrypt=True;Trusted_Connection=False;MultipleActiveResultSets=True");
    public int ToDoCount;
    public string CurrentUser;
    public string ToDoWhereStatement;
    protected void Page_Load(object sender, EventArgs e)
    {
        CurrentUser = System.Web.HttpContext.Current.User.Identity.Name.Replace("@lightstreet.com", "");
        if (CurrentUser == "jay" || CurrentUser == "gaurav")
        {
            ToDoWhereStatement = "Jay Kahn' OR Analyst='Gaurav Gupta";
        }
        if (CurrentUser == "sbluestein" || CurrentUser == "bryan")
        {
            ToDoWhereStatement = "Stephen Bluestein' OR Analyst='Bryan Hsu";
        }
        if (CurrentUser == "glen")
        {
            ToDoWhereStatement = "Glen Kacher";
        }
        if (CurrentUser == "gordon" || CurrentUser=="kan")
        {
            ToDoWhereStatement = "Gordon Green' OR Analyst='Kan Yuan";
        }
        SqlConnection connTodo = new SqlConnection("Server=tcp:lscresearch.database.windows.net,1433;Database=LSPM_Portfolio;User Id=LSAdministrator;Password=LSCResearch17!;Encrypt=True;Trusted_Connection=False;MultipleActiveResultSets=True");
        connTodo.Open();
        if (CurrentUser == "jay" || CurrentUser == "gaurav" || CurrentUser == "sbluestein" || CurrentUser == "bryan" || CurrentUser == "glen" || CurrentUser == "gordon" || CurrentUser == "kan" || CurrentUser == "kevin" || CurrentUser == "mario")
        {
            SqlCommand ToDoCountSQL = new SqlCommand("select ISNULL(IIF(Process+MemoReview+PrivateCoTracker+ScenarioManagement+EarningsCount>99,99,Process+MemoReview+PrivateCoTracker+ScenarioManagement+EarningsCount),0) from dashboardcounter WHERE Analyst='" + CurrentUser + "'", connTodo);
            try {ToDoCount = Convert.ToInt32(ToDoCountSQL.ExecuteScalar());} catch {}
        }
        else
        {
            ToDoCount = 0;
        }
        connTodo.Close();
        if (!Request.Browser.IsMobileDevice)
        {
            var h2 = new HtmlGenericControl("h2");
            h2.InnerHtml = "Visual Pipeline";
            MyServerControlDiv.Controls.Add(h2);
            OrangeNAVBar.Attributes.Remove("class");
            OrangeNAVBar.Attributes.Add("class", "w3-bar w3-orange");
            mySidenav.Attributes.Remove("class");
            mySidenav.Attributes.Add("class", "w3-sidenav w3-collapse w3-blue w3-card-2");
        }
        else
        {
            SpotlightPicture.Height = 30; SpotlightPicture.Width = 240; var h1 = new HtmlGenericControl("h1");
            h1.InnerHtml = "Visual Pipeline";
                   try { MyServerControlDiv.Controls.Add(h1);  } catch {} SpotlightIconDiv.Attributes.Remove("class"); SpotlightIconDiv.Attributes.Add("class", "mobileSpotlightIcon");
            GridView1.Font.Size = 15;
        }   
    }

    protected void Event_SqlDataSourceWorklist_Filtering(object sender, System.EventArgs e)
    {
        SqlDataSource1.FilterParameters.Clear();
        SqlDataSource2.FilterParameters.Clear();
        SqlDataSource3.FilterParameters.Clear();
        SqlDataSource4.FilterParameters.Clear();
        SqlDataSource5.FilterParameters.Clear();
        SqlDataSource6.FilterParameters.Clear();
        SqlDataSource7.FilterParameters.Clear();
        SqlDataSource8.FilterParameters.Clear();

        ControlParameter controlParamCaseNo = new ControlParameter();
        controlParamCaseNo.ControlID = "ddlAnalyst";
        controlParamCaseNo.PropertyName = "SelectedValue";
        controlParamCaseNo.Name = "Analyst";
        SqlDataSource1.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource2.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource3.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource4.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource5.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource6.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource7.FilterParameters.Add(controlParamCaseNo);
        SqlDataSource8.FilterParameters.Add(controlParamCaseNo);

        try
        {
            SqlDataSource1.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource2.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource3.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource4.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource5.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource6.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource7.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
        try
        {
            SqlDataSource8.FilterExpression = "[Analyst] = '{0}'";
        }
        catch { }
    }


    public string ImgString;
    public string TitleString;
    public string LSString;
    public string ADVString;
    public string ProjectString;
    public int TableRowCount = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView gridView = (GridView)sender;
        if (e.Row.RowType == DataControlRowType.Header)
        {
            TableRowCount = 0;
            //e.Row.Cells[0].ColumnSpan = 2;
            //e.Row.Cells[0].Attributes["width"] = "10px";
            e.Row.Cells[1].Style["font-size"] = "12px";
            e.Row.Cells[0].Text = "";
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
            e.Row.Cells[1].Text = "";
            e.Row.Style["border-top"] = "1px solid black";
            e.Row.Style["border-left"] = "1px solid black";
            e.Row.Style["border-right"] = "1px solid black";
            e.Row.Style["border-bottom"] = "1px solid black";
            e.Row.Cells[1].Style["border-right"] = "1px solid black";
            if (sender == GridView1)
            {
                e.Row.Cells[1].Text = "Progress: 0";
            }
            if (sender == GridView2)
            {
                e.Row.Cells[1].Text = "Progress: 1";
            }
            if (sender == GridView3)
            {
                e.Row.Cells[1].Text = "Progress: 2";
            }
            if (sender == GridView4)
            {
                e.Row.Cells[1].Text = "Progress: 3";
            }
            if (sender == GridView5)
            {
                e.Row.Cells[1].Text = "Progress: 4";
            }
            if (sender == GridView6)
            {
                e.Row.Cells[1].Text = "Progress: 5";
            }
            if (sender == GridView7)
            {
                e.Row.Cells[1].Text = "Progress: 6";
            }
            if (sender == GridView8)
            {
                e.Row.Cells[1].Text = "Progress: 7";
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[0].Text.Contains(","))
            {
                e.Row.Visible = false;
            }
            TableRowCount++;
            e.Row.Cells[0].Attributes.Add("class", "col");
            e.Row.Cells[1].Attributes.Add("class", "col");
            e.Row.Cells[0].Style["vertical-align"] = "top";

            if (e.Row.Cells[1].Text=="Jay Kahn" || e.Row.Cells[1].Text == "Gaurav Gupta")
            {
                ImgString = "<img src='../../Images/JayLogo.png' style='vertical-align: top;' height='30px' >";
            }
            if (e.Row.Cells[1].Text == "Glen Kacher")
            {
                ImgString = "<img src='../../Images/GlenLogo.png' style='vertical-align: top;' height='30px' >";
            }
            if (e.Row.Cells[1].Text == "Gordon Green")
            {
                ImgString = "<img src='../../Images/GordonLogo.png' style='vertical-align: top;' height='30px' >";
            }
            if (e.Row.Cells[1].Text == "Stephen Bluestein")
            {
                ImgString = "<img src='../../Images/BluesteinLogo.png' style='vertical-align: top;' height='30px' >";
            }
            if (e.Row.Cells[1].Text == "Bryan Hsu")
            {
                ImgString = "<img src='../../Images/BryanLogo.png' style='vertical-align: top;' height='30px' >";
            }
            try
            {
                TitleString = e.Row.Cells[7].Text.Substring(0, e.Row.Cells[7].Text.IndexOf(":"));
            }
            catch { TitleString = e.Row.Cells[0].Text; }
            if (e.Row.Cells[6].Text == "Long")
            {
                LSString = "<span style='color:green;font-size:12px'>Long</span>";
            }
            else
            {
                LSString = "<span style='color:red;font-size:12px'>Short</span>";
            }
            try { ADVString = "$" + String.Format("{0:$#,##0}", Convert.ToString(Math.Round(Convert.ToDouble(e.Row.Cells[5].Text) / 1000000, 0))); } catch { ADVString = "N/A"; }
            try
            {
                if (e.Row.Cells[7].Text.IndexOf(":") < 0)
                {
                    ProjectString = e.Row.Cells[7].Text;
                }
                else
                {
                    ProjectString = e.Row.Cells[7].Text.Substring(e.Row.Cells[7].Text.IndexOf(":") + 2, e.Row.Cells[7].Text.Length - e.Row.Cells[7].Text.IndexOf(":") - 2);
                }
            }
            catch { ProjectString = e.Row.Cells[7].Text; }
            
            e.Row.Cells[1].Text = "<span style='float:right'><b>" + LSString + "</b></span><b><span style='font-size:12px'><a href='LSPMNewIdea.aspx?Ticker=" + e.Row.Cells[0].Text + "'>" + TitleString + "</a></span></b> ADV: <b>" + ADVString + "</b><br>Priority: <b>" + e.Row.Cells[4].Text + "</b> Analyst:<b> " + e.Row.Cells[2].Text + " </b>PM:<b> " + e.Row.Cells[3].Text + "</b><br>Status: <b>" + e.Row.Cells[8].Text + "</b> Updated: <b>" + e.Row.Cells[9].Text.Replace(" 12:00:00 AM","") + "</b><br><i>" + ProjectString + "</i>";
            e.Row.Cells[0].Text = ImgString;
            
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal);
            row.BackColor = System.Drawing.Color.Transparent;
            row.Cells.AddRange(new TableCell[2] { new TableCell (),
                                            new TableCell ()
                    });

            try
            {
                gridView.Controls[0].Controls.AddAt(TableRowCount, row);
            }
            catch {  }
            row.Style["border-top"] = "0px solid black";
            row.Style["border-left"] = "0px solid black";
            row.Style["border-right"] = "0px solid black";
            row.Style["border-bottom"] = "0px solid black";
            TableRowCount++;
        }
        for (int i=2; i<13; i++)
        {
            try
            {
               e.Row.Cells[i].Visible = false;
            }
            catch { }
        }
    }
}