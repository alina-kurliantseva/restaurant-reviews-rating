using System;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Web.Configuration;

public partial class restaurant_reviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        XslCompiledTransform transform = null;
        if (Application["restaurantReviewXslt"] == null)
        {
            transform = new XslCompiledTransform();
            string xsltPath = WebConfigurationManager.AppSettings["restaurantReviewXsltPath"];
            transform.Load(xsltPath);
            Application["restaurantReviewXslt"] = transform;
        }
        else
        {
            transform = Application["restaurantReviewXslt"] as XslCompiledTransform;
        } 
        int minRating = int.Parse(txtMinRating.Text);
        XsltArgumentList xslArguments = new XsltArgumentList();
        xslArguments.AddParam("minRating", "", minRating.ToString());
        StringBuilder htmlStringBuilder = new StringBuilder();
        XmlWriter xw = XmlWriter.Create(htmlStringBuilder);
        string xmlPath = WebConfigurationManager.AppSettings["restaurantReviewXmlPath"];
        transform.Transform(xmlPath, xslArguments, xw);
        string htmlString = htmlStringBuilder.ToString();
        divRestaurantReviews.InnerHtml = htmlString;
    }
}