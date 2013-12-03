using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            CreatePDFFile();
        }
    }
    /// <summary>
    /// Function which will create pdf document and save in the server folder
    /// </summary>
    private void CreatePDFFile()
    {
        Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 10, 10);
        try
        {
            string pdfFilePath = Server.MapPath(".") + "/pdf/myPdf.pdf";

            //Create Document class object and set its size to letter and give space left, right, Top, Bottom Margin
            PdfWriter wri = PdfWriter.GetInstance(doc, new FileStream(pdfFilePath, FileMode.Create));
            doc.Open();//Open Document to write
            doc.SetMargins(0, 0, 0, 0);

            //Write some content into pdf file
          //  Paragraph paragraph = new Paragraph("Profile Pictures");
           
            // Now image in the pdf file
            string imageFilePath = Server.MapPath(".") + "/image/photo (2).jpg";
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


   
}
