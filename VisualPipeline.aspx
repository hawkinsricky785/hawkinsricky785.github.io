<%@ Page Title="" Language="C#"  CodeFile="VisualPipeline.aspx.cs" Inherits="webpages_LSPM_Summary_Default" enableEventValidation="false" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>
<html>

<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
<meta name="viewport" content="target-densitydpi=device-dpi" /> 
<meta name="HandheldFriendly" content="true"/>
<link rel="stylesheet" href="../../js/stylev2.1.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <link rel="stylesheet" href="../../js/fontawesome-pro-5.2.0-web/css/all.css">

<head>   
     <link rel="icon" href="../../Images/LS Logo Box.jpg"><link rel="apple-touch-icon" href="https://media.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAAW0AAAAJGQyZTBkOTIyLTYyMTEtNGQ5Yi05MjU1LTgyNzNjY2MwMTNlMQ.png">
    <META HTTP-EQUIV="REFRESH" CONTENT="43200;URL=../../.auth/logout">
</head>
<title>Visual Pipeline</title>
<style>
    html {overflow-x:scroll}
    .GridViewCSS {
        
    }
    .RowStyle {
        border: 1px solid #808080;
        margin-bottom: 100px;
    }
</style>

<body>
    
    <form id="form1" runat="server">	
<nav class="w3-sidenavMobile w3-collapse w3-blue w3-card-2" runat="server" id="mySidenav">
  <a href="#" onclick="w3_close()" class="w3-closenav w3-hide-large" style="border-bottom:1px solid black;">Close &times;</a> 
    <div id="SpotlightIconDiv" runat="server" class="desktopSpotlightIcon">
    <a href="../LSPM/LSPMSummary.aspx" style="padding:0;padding-top:4px;background-color:white;"><img src='../../Images/spotlightlogo.png' id="SpotlightPicture" runat="server" width="150"/></a>
        </div>
    <a href="../Information/mySpotlight.aspx"><i class="far fa-user-circle fa-fw"></i> <%=System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(CurrentUser)%> <span class="numberCircle1"><%=ToDoCount%></span></a>
    
  <a href="../LSPM/LSPMSummary.aspx"><i class="far fa-home fa-fw"></i> HF Port Mgmt</a>
    <a href="../Analytics/RiskStatistics.aspx"><i class="far fa-calendar fa-fw"></i> HF Historical</a>   <a href="../Analytics/LORiskStatistics.aspx"><i class="far fa-calendar fa-fw"></i> LO Historical</a> 
    <a href="../Default.aspx"><i class="far fa-file-alt fa-fw"></i> Portfolio News</a>
    <a href="../ResearchSupport/ResearchHome.aspx"><i class="far fa-search fa-fw"></i> Data Science</a> <a href="../RMS/PersonHome.aspx"><i class="far fa-users fa-fw"></i> Relationships</a> 
    <a class="w3-text-teal" href="../LSPM/IdeaPipeline.aspx"><i class="fa fa-lightbulb-o fa-fw"></i> Research Process</a>
  <a href="../LSPM/LSPMScorecard.aspx"><i class="far fa-flag fa-fw"></i> Public Co. Mgmt</a> 
      <a href="../Analytics/VaRAnalysis.aspx"><i class="far fa-chart-bar fa-fw"></i> Risk Analysis</a>
  <a href="../Ops/OpsReports.aspx"><i class="far fa-folder-open fa-fw"></i> Operations</a> <a href="../Information/LSPMInfoScorecard.aspx"><i class="far fa-tasks fa-fw"></i> Analysts</a> <a href="../Ops/OpsAUMErin.aspx"><i class="far fa-chart-pie fa-fw"></i> Marketing</a>
  <a href="../Information/BrokerContacts.aspx"><i class="far fa-money-bill-alt fa-fw"></i> Brokers</a>
    
    <a href="../LSPMLongOnly/LSPMSummary.aspx"><i class="far fa-chart-line fa-fw"></i> LO Port Mgmt</a> <a href="../LSPM/IPO_Home.aspx"><i class="fa fa-arrow-up"></i>&nbsp; IPO Port Mgmt</a>  <a href="../LSPMPrivate/PrivatePortfolio.aspx"><i class="far fa-handshake fa-fw"></i> Private Port Mgmt</a> 
    <a href="../Information/CloudApplications.aspx"><i class="far fa-cloud fa-fw"></i> Cloud Apps</a><a href="../Ops/MSSecurityMaster.aspx"><i class="far fa-cog fa-fw"></i> Settings</a>
</nav>

<div class="w3-main" style="margin-left:160px">
<header class="w3-container w3-light-blue">
  <span class="w3-opennav w3-xlarge w3-hide-large" style="float:left;padding-top:17px;padding-right:22px" onclick="w3_open()"><img src="../../Images/threelines.png" height="40" /></span>
  <div class="cls" runat="server" id="MyServerControlDiv" style="float:left"></div>
</header>

<div class="w3-barMobile w3-orange" runat="server" id="OrangeNAVBar">
    <a class="w3-bar-item w3-button" href="IdeaPipeline.aspx">Idea Pipeline</a>
    <a class="w3-bar-item w3-button w3-text-white" href="VisualPipeline.aspx">Visual Pipeline</a> 
    <a class="w3-bar-item w3-button" href="MemoWriter.aspx">Memo Writer</a>    
    <a class="w3-bar-item w3-button" href="MemoReview.aspx">Memo Review</a> 
    <a class="w3-bar-item w3-button" href="IPOUnicorn.aspx">Private Co Tracker</a>  
</div>
<div class="w3-container">     
    <asp:HiddenField ID="hdnfldTickerList" runat="server" />
    <span style="font-weight:bold;font-size:11px">&nbsp;Analyst:</span>
       <asp:dropDownList runat="server" OnSelectedIndexChanged="Event_SqlDataSourceWorklist_Filtering" AutoPostBack="true" ID="ddlAnalyst" style="font-size:12px; width:100px">
            <asp:ListItem Text="All" Value="" />
            <asp:ListItem Text="Glen Kacher" Value="Glen Kacher" />
            <asp:ListItem Text="Jay Kahn" Value="Jay Kahn" />
           <asp:ListItem Text="Stephen Bluestein" Value="Stephen Bluestein" />
            <asp:ListItem Text="Gordon Green" Value="Gordon Green" />
            <asp:ListItem Text="Bryan Hsu" Value="Bryan Hsu" />
            <asp:ListItem Text="Gaurav Gupta" Value="Gaurav Gupta" />
        </asp:dropDownList>

    <div id="CardTable" style="overflow:scroll">
    <table >
    <tr>
        <td valign="top">
    <asp:GridView ID="GridView1" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView2" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource2" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView3" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource3" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView4" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource4" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView5" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource5" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView6" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource6" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView7" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource7" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        <td valign="top">
    <asp:GridView ID="GridView8" Width="300px" runat="server" ShowHeaderWhenEmpty="true" CssClass="GridViewCSS" DataSourceID="SqlDataSource8" onrowdatabound="GridView1_RowDataBound" AutoGenerateColumns="true" BackColor="White" BorderColor="white" BorderStyle="solid" BorderWidth="1px" CellPadding="3" Font-Size="XXSmall" GridLines="None" >
            <RowStyle BackColor="#f4f4f4" CssClass="RowStyle"  />
            <Columns>          
            </Columns>
            <EmptyDataTemplate>No ideas fit criteria.</EmptyDataTemplate>
            <FooterStyle BackColor="white" CssClass="FooterStyle" ForeColor="Black" Font-Bold="true" />
            <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" wrap="false"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
        </asp:GridView>
            </td>
        </tr>
        </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT ARicky.Ticker, ARicky.Analyst, ARicky.AnalystPriority, ARicky.PMPriority, ARicky.[Priority], ARicky.[ADVUSD], ARicky.Category, ARicky.Project,  IIF(ISNULL(BRicky.Ticker,0)='0',ARicky.[Status],'Completed') AS [StatusChanged], ARicky.[DateAdded], ARicky.ScenMgmt, ARicky.[Progress Score] FROM 
(SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=0) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
            WHERE [Status]!='Stalled') ARicky
			LEFT JOIN
(SELECT * FROM MemoLibrary) BRicky
ON ARicky.Ticker=BRicky.Ticker
	 ORDER BY ARicky.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=1) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=2) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=3) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=4) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=5) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=6) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings: SqlDataSource1 %>"
            SelectCommand="SELECT aaa.*, bbb.MSLongDescription AS [Name] FROM
(SELECT DISTINCT RickyA.Ticker, RickyA.Analyst, RickyA.AnalystPriority, RickyA.PMPriority, RickyA.[Priority], RickyB.[ADVUSD], RickyA.Category,RickyA.Project, RickyA.[Status], RickyA.[DateAdded], RickyA.ScenMgmt, RickyA.[Progress Score] FROM 
(SELECT a.*, ISNULL(b.PriceTarget1,0) AS [ScenMgmt], 
CASE 
	WHEN (ProprietaryComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (BasicComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (ManagementComplete='True')
		THEN 1
	ELSE 0
	END +
	CASE
WHEN (MarketComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CompetitorComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (CustomerComplete='True')
		THEN 1
	ELSE 0
	END +
CASE
	WHEN (VentureComplete='True')
		THEN 1
	ELSE 0
	END
	AS [Progress Score]
 FROM 
(select DISTINCT
               [Ticker],
    [ResponsibleUser] AS [Analyst],
    [AnalystPriorityRating] AS [AnalystPriority],
    [PMPriorityRating] AS [PMPriority],
	CASE
		WHEN [AnalystPriorityRating] = 'High'
			THEN 3
		WHEN [AnalystPriorityRating] = 'Medium'
			THEN 2
		WHEN [AnalystPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
	+ 
	CASE
		WHEN [PMPriorityRating] = 'High'
			THEN 3
		WHEN [PMPriorityRating] = 'Medium'
			THEN 2
		WHEN [PMPriorityRating] = 'Low'
			THEN 1
		ELSE 0
		END
		 AS [Priority],
    [Category],
    [Project],
    IIF(GETUTCDATE()-180>[DateAdded],'Stalled',CASE 
        WHEN [Status] = 'Not Started' 
            THEN 'Pipeline'
        WHEN [Status] = 'In Progress' 
            THEN 'In Process'
        WHEN [Status] = 'In Process' 
            THEN 'In Process'
        WHEN [Status] = 'Pipeline' 
            THEN 'Pipeline'
    END) as [Status],
    [DateAdded]
from idea_pipeline
    where [Status] in ('In Progress', 'Not Started', 'In Process', 'Complete', 'Pipeline') and Ticker!=''
    ) a
	LEFT JOIN
	(SELECT * FROM (select *, ROW_NUMBER() OVER (PARTITION BY [Ticker] ORDER BY [Update Date] DESC) as rn from lspmscenariomanagement) RickyTable where rn=1) b
	ON a.Ticker=b.Ticker) RickyA
LEFT JOIN
(select DISTINCT (SELECT CASE WHEN [ADVUSD] IS NULL THEN '' ELSE REPLACE([Ticker],' US','') END) AS [Ticker], [ADVUSD] from [em template]) RickyB
ON RickyA.Ticker=RickyB.Ticker

WHERE [Progress Score]=7) aaa
LEFT JOIN
(select * from ms_id) bbb
ON TRIM(aaa.Ticker)=REPLACE(bbb.BloombergTicker,' US','')
        WHERE [Status]!='Stalled'
	 ORDER BY aaa.[Priority] DESC
	 
	 " > </asp:SqlDataSource>
</div>       
    </form>

 
 <script>
        $("#project").keypress(function (e) {
            if (e.which == 13) {
                window.location.href = "LSPMScenarioManagement.aspx?Ticker=" + document.getElementById("project").value;
                return false;
            }
        });
    </script>
<script>
    function w3_open() {
        document.getElementById("mySidenav").style.display = "block";
        
    }
    function w3_close() {
        document.getElementById("mySidenav").style.display = "none";
        
    }
    function myAccFunc() {
        var x = document.getElementById("demoAcc");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-black";
        } else {
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className =
            x.previousElementSibling.className.replace(" w3-black", "");
        }
    }
    function myAccFunc2() {
        var x = document.getElementById("demoAcc2");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-black";
        } else {
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className =
            x.previousElementSibling.className.replace(" w3-black", "");
        }
    }


</script>
    
       <script>
        $(function () {
            var projects = JSON.parse(document.getElementById("hdnfldTickerList").value);

            function lightwell(request, response) {
                function hasMatch(s) {
                    return s.toLowerCase().indexOf(request.term.toLowerCase()) !== -1;
                }
                var i, l, obj, matches = [];

                if (request.term === "") {
                    response([]);
                    return;
                }

                for (i = 0, l = projects.length; i < l; i++) {
                    obj = projects[i];
                    if (hasMatch(obj.MSLongDescription) || hasMatch(obj.BloombergTicker)) {
                        matches.push(obj);
                    }
                }
                response(matches);
            }

            $("#project").autocomplete({
                minLength: 1,
                source: lightwell,
                focus: function (event, ui) {
                    $("#project").val(ui.item.GlenName);
                    return false;
                },
                select: function (event, ui) {
                    $("#project").val(ui.item.GlenName);
                    $("#project-id").val(ui.item.BloombergTicker); 
                    location.href = "LSPMScenarioManagement.aspx?Ticker=" + ui.item.BloombergTicker

                    return false;
                }
            })

            .data("ui-autocomplete")._renderItem = function (ul, item) {
                return $("<li>")
                    .append("<a>" + item.GlenName +
                        "<br><span style='font-size: 75%;'>Ticker: " + item.BloombergTicker + "</span></a>")
                    .appendTo(ul);
            };
        });

    </script>
             <script type="text/javascript" src="../../js/jquery-min.js"></script> 


             <script>
            function setHeight() {
                $("#CardTable").height(window.innerHeight - 180);
            }

            $(document).ready(setHeight);
            $(window).resize(setHeight);

        </script>
</body>
</html>

