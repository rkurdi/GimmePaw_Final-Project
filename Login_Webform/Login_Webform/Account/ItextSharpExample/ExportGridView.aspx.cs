using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;

public partial class ExportGridView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = GetDataTable();
            GridView1.DataBind();
        }
    }

    private DataTable GetDataTable()
    {
        // Create an object of DataTable class
        DataTable dataTable = new DataTable("MyDataTable");//Create ID DataColumn
        DataColumn dataColumn_ID = new DataColumn("ID", typeof(Int32));
        dataTable.Columns.Add(dataColumn_ID);//Create another DataColumn Name
        DataColumn dataColumn_Name = new DataColumn("Name", typeof(string));
        dataTable.Columns.Add(dataColumn_Name);
        //Now Add some row to newly created dataTable
        DataRow dataRow;for (int i = 0; i < 5; i++)
        {
            dataRow = dataTable.NewRow();
            // Important you have create New row
            dataRow["ID"] = i;dataRow["Name"] = "Some Text " + i.ToString();
            dataTable.Rows.Add(dataRow);
        }
        dataTable.AcceptChanges();
        return dataTable;
    }
    protected void btnGeneratePDF_Click(object sender, EventArgs e)
    {
        ExportDataToPDFTable();
    }

    /// <summary>
    /// Function which will create pdf document and save in the server folder
    /// </summary>
    private void ExportDataToPDFTable()
    {
        Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 42, 35);
        try
        {

            string pdfFilePath = Server.MapPath(".") + "/pdf/myPdf.pdf";

            //Create Document class object and set its size to letter and give space left, right, Top, Bottom Margin
            PdfWriter wri = PdfWriter.GetInstance(doc, new FileStream(pdfFilePath, FileMode.Create));

            doc.Open();//Open Document to write

             Font font8 = FontFactory.GetFont("ARIAL", 7);

            //Write some content
             Paragraph paragraph = new Paragraph("Using ITextsharp I am going to show how to create simple table in PDF document ");

            DataTable dt = GetDataTable();

            if (dt != null)
            {
                //Craete instance of the pdf table and set the number of column in that table
                PdfPTable PdfTable = new PdfPTable(dt.Columns.Count);
                PdfPCell PdfPCell = null;


                //Add Header of the pdf table
                PdfPCell = new PdfPCell(new Phrase(new Chunk("ID", font8)));
                PdfTable.AddCell(PdfPCell);

                PdfPCell = new PdfPCell(new Phrase(new Chunk("Name", font8)));
                PdfTable.AddCell(PdfPCell);


                //How add the data from datatable to pdf table
                for (int rows = 0; rows < dt.Rows.Count; rows++)
                {
                    for (int column = 0; column < dt.Columns.Count; column++)
                    {
                        PdfPCell = new PdfPCell(new Phrase(new Chunk(dt.Rows[rows][column].ToString(), font8)));
                        PdfTable.AddCell(PdfPCell);
                    }
                }

                PdfTable.SpacingBefore = 15f; // Give some space after the text or it may overlap the table

                doc.Add(paragraph);// add paragraph to the document
                doc.Add(PdfTable); // add pdf table to the document

            }

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
