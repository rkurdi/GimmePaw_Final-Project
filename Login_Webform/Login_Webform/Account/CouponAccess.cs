using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Device.Location;

namespace Login_Webform.Account
{
    public class Coupon
    {
        public string Description { get; set; }
        public string Url { get; set; }
        //public string Photo { get; set; }
    }

    public class CouponReduced
    {
        public string Description { get; set; }
        public string Url { get; set; }
    }

    public class CouponAccess
    {
        static string zipcode = "";
        public static void LatLong(string zip)
        {
            zipcode = zip;
        }
        public static List<Coupon> GetCoupons()
        {
            GeoCoordinateWatcher watcher;
            watcher = new GeoCoordinateWatcher();

            //string[] latlon = latlong.Split(',');
            //string lat = latlon[0];
            //string lon = latlon[1];

            //double lat = watcher.Position.Location.Latitude;
            //double lon = watcher.Position.Location.Longitude;

            //String path = @"C:\Users\rebarkurdi\MyTest.txt";

            //using (StreamWriter sw = File.CreateText(path))
            //{
                
            //}

            List<Coupon> listCoupon = new List<Coupon>();
            //List<CouponReduced> modifiedListCoupon = new List<CouponReduced>();            


            var jsonres_subcategory = new WebClient().DownloadString("http://api.8coupons.com/v1/getsubcategory");
            JsonTextReader jsontxtreader_subcategory = new JsonTextReader(new StringReader(jsonres_subcategory));

            List<string> listsubcategoryid = new List<string>();
            while (jsontxtreader_subcategory.Read())
            {
                if (jsontxtreader_subcategory.Value != null)
                {
                    object val = jsontxtreader_subcategory.Value;
                    string strval = val.ToString();

                    if (strval.Equals("Pets"))
                    {
                        jsontxtreader_subcategory.Read();
                        jsontxtreader_subcategory.Read();
                        string subcategoryid = jsontxtreader_subcategory.Value.ToString();
                        listsubcategoryid.Add(subcategoryid);
                    }
                }
            }

            List<string> list_images = new List<string>();
            List<string> list_urls = new List<string>();
            List<string> list_titles = new List<string>();

            //using (StreamWriter sw = File.AppendText(path))
            //{
                //foreach(string str in listsubcategoryid)

                  //  sw.WriteLine(str);

            //}
            bool read1 = false;
            bool read2 = false;
            bool read3 = false;

            foreach (string id in listsubcategoryid)
            {

                var jsonres_deals = new WebClient().DownloadString("http://api.8coupons.com/v1/getdeals?key=21daccb0b8c5abd5bdec1f58f192959f3e1b1d1281f3f0551333587317112f008759b270fb14a298e4bb93d04e00bf51&zip=" + zipcode + "&mileradius=50&orderby=radius&subcategoryID=" + id);
                JsonTextReader jsontxtreader_deals = new JsonTextReader(new StringReader(jsonres_deals));
                string url = "";
                string desc = "";

                while (jsontxtreader_deals.Read())
                {
                    Coupon coupon = new Coupon();
              //      CouponReduced modifiedCoupon = new CouponReduced();

                    bool flag = false;

                    if (jsontxtreader_deals.Value != null)
                    {
                        object val_url = jsontxtreader_deals.Value;
                        string strval_url = val_url.ToString();

                        if (strval_url.Equals("URL"))
                        {
                            //jsontxtreader_deals.Read();
                            read1 = true;
                            jsontxtreader_deals.Read();
                            string subcategoryid_url = jsontxtreader_deals.Value.ToString();
                            url = subcategoryid_url;
                            //string htmlurl = new HtmlString(url);
                            
                            list_urls.Add(url);
                            coupon.Url = url;
              //              using (StreamWriter sw = File.AppendText(path))
                            //{
                              //  sw.WriteLine(coupon.Url);
                            //}
                            flag = true;

                        }

                    }

                    if (jsontxtreader_deals.Value != null)
                    {
                        object val_title = jsontxtreader_deals.Value;
                        string strval_title = val_title.ToString();

                        if (strval_title.Equals("dealTitle"))
                        {
                            //    jsontxtreader_deals.Read();
                            read2 = true;
                            jsontxtreader_deals.Read();
                            string subcategoryid_title = jsontxtreader_deals.Value.ToString();
                            desc = subcategoryid_title;
                            list_titles.Add(subcategoryid_title);
                            coupon.Description = subcategoryid_title;
                            flag = true;
                        }

                    }

                    if (jsontxtreader_deals.Value != null)
                    {
                        object val_image = jsontxtreader_deals.Value;
                        string strval_image = val_image.ToString();

                        if (strval_image.Equals("showImage"))
                        {
                            //    jsontxtreader_deals.Read();
                            read3 = true;
                            jsontxtreader_deals.Read();
                            string subcategoryid_image = jsontxtreader_deals.Value.ToString();
                            //list_images.Add(subcategoryid_image);
                            //coupon.Photo = subcategoryid_image;
                            flag = true;
                        }

                    }
                    if (flag == true && read1 == true && read2 == true && read3 == true)
                    {
                        //using (StreamWriter sw = File.AppendText(path))
                        //{
                            //sw.WriteLine();
                          //  sw.WriteLine("Coupon Url: " + coupon.Url);
                            //sw.WriteLine("Coupon description
                        //}
                        coupon.Url = url;
                        coupon.Description = desc;

                        listCoupon.Add(coupon);

                        read1 = false;
                        read2 = false;
                        read3 = false;
                        url = "";
                        desc = "";
                    }
                    flag = false;

                }
                //listCoupon.Add(coupon);
            }

            return listCoupon;
        }
    }
}