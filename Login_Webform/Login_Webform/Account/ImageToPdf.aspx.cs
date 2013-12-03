using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using System.IO;


namespace Login_Webform.Account
{
    public partial class ImageToPdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
             //   string g = "1";
            }
            else
            {
                lblName.Text = Session["Username"].ToString();

            }

            string pathToCreate = "~/PDFImages/" + Session["Username"].ToString() + "/";
            string pathToCreate1 = "~/PDFToConvert/" + Session["Username"].ToString() + "/";
            if (!System.IO.Directory.Exists(Server.MapPath(pathToCreate)) && !System.IO.Directory.Exists(Server.MapPath(pathToCreate1)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate1));
            }


            string[] filesindirectory = Directory.GetFiles(Server.MapPath("../PDFImages/" + Session["Username"].ToString()));
            List<String> images = new List<string>(filesindirectory.Count());
            string[] hiddenLabels = new string[filesindirectory.Count()];
            //hiddencount.Value = String.Join(",",hiddenLabels);
            int count = 0;
            foreach (string item in filesindirectory)
            {

                images.Add(String.Format("../PDFImages/" + Session["Username"].ToString() + "/{0}", System.IO.Path.GetFileName(item)));
                string[] name = item.Split('.');
                string tmp_fname = name[name.Length - 2];
                string[] fname = tmp_fname.Split('\\');
                hiddenLabels[count] = fname[fname.Length - 1];
                count++;
            }
            hiddenlabel.Value = String.Join("&", hiddenLabels);

            RepeaterImages.DataSource = images;
            RepeaterImages.DataBind();            
            //if (!IsPostBack)
            //{
                //CreatePDFFile();
            //}
        }

        protected void CreatePDFFile(object sender, EventArgs e)
        {
            string pathToCreate = "~/PDFImages/" + Session["Username"].ToString() + "/";
            string pathToCreate1 = "~/PDFToConvert/" + Session["Username"].ToString() + "/";
            if (System.IO.Directory.Exists(Server.MapPath(pathToCreate)) && System.IO.Directory.Exists(Server.MapPath(pathToCreate1)))
            {

                FileUpload1.SaveAs(Server.MapPath(pathToCreate + FileUpload1.FileName));
            }
            else
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathToCreate));
                FileUpload1.SaveAs(Server.MapPath(pathToCreate + FileUpload1.FileName));
            }

            Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 10, 10);
            try
            {
                string pdfFilePath = Server.MapPath(pathToCreate1)+"/"+FileUpload1.FileName+".pdf";

                //Create Document class object and set its size to letter and give space left, right, Top, Bottom Margin
                PdfWriter wri = PdfWriter.GetInstance(doc, new FileStream(pdfFilePath, FileMode.Create));
                doc.Open();//Open Document to write
                doc.SetMargins(0, 0, 0, 0);

                //Write some content into pdf file
                //  Paragraph paragraph = new Paragraph("Profile Pictures");

                // Now image in the pdf file
                //string imageFilePath = Server.MapPath(".") + "/image/photo (2).jpg";
                string imageFilePath = Server.MapPath(pathToCreate + FileUpload1.FileName);
                iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageFilePath);
                //Resize image depend upon your need
                jpg.ScaleToFit(700f, 800f);
                jpg.Border = Rectangle.BOX;
                jpg.BorderColor = Color.BLACK;
                jpg.BorderWidth = 15f;
                //  jpg.GetImageRotation();
                jpg.RotationDegrees = 270f;



                //Give space before image
                // jpg.SpacingBefore = 30f;

                //Give some space after the image
                //  jpg.SpacingAfter = 1f;
                jpg.Alignment = Element.ALIGN_CENTER;

                // doc.Add(paragraph); // add paragraph to the document

                doc.Add(jpg); //add an image to the created pdf document
            }
            catch (DocumentException docEx)
            {
                //handle pdf document exception if any
            }
            catch (IOException ioEx)
            {
                // handle IO exception
            }
            catch (Exception ex)
            {
                // ahndle other exception if occurs
            }
            finally
            {
                //Close document and writer
                doc.Close();

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

    }
}