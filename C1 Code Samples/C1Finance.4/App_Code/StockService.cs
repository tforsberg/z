using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Services;

[ServiceContract(Namespace = "http://stockinfoservice.componentone.com/")]
[WebService(Namespace = "http://stockinfoservice.componentone.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class StockService
{
	// To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
	// To create an operation that returns XML,
	//     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
	//     and include the following line in the operation body:
	//         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
    [WebMethod]
    [OperationContract]
	public List<Stock> GetStocks(string Symbols)
	{
        return Stocks.GetStocks(Symbols);
	}

    [WebMethod]
    [OperationContract]
    public List<Stock> GetStockHistory(string Symbol, DateTime StartDate, DateTime EndDate)
    {
        return Stocks.GetStockHistory(Symbol, StartDate, EndDate);
    }
}
