using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace ProjectTest
{
    public class DogFoodie
    {
        public string Description { get; set; }
        public string Url { get; set; }
        public string Price { get; set; }
        public string Photo { get; set; }
    }


    public class DogFoodAccess
    {
        public static List<DogFoodie> GetDogFood()
        {
            List<DogFoodie> listDogFood = new List<DogFoodie>();

            var jsonres_df = new WebClient().DownloadString("http://api.walmartlabs.com/v1/search?apiKey=vmf5u9uuqnvqpj7r7rmhsdbu&query=dog%20food");
            JsonTextReader jsontxtreader_df = new JsonTextReader(new StringReader(jsonres_df));

            List<string> list_images = new List<string>();
            List<string> list_urls = new List<string>();
            List<string> list_titles = new List<string>();


            bool read1 = false;
            bool read2 = false;
            bool read3 = false;
            bool read4 = false;

            string url = "";
            string desc = "";
            string price = "";
            string photo = "";

            while (jsontxtreader_df.Read())
            {
                DogFoodie dogfood = new DogFoodie();
                 
                bool flag = false;

                if (jsontxtreader_df.Value != null)
                {
                    object val_name = jsontxtreader_df.Value;
                    string strval_name = val_name.ToString();

                    if (strval_name.Equals("name"))
                    {
                        read1 = true;
                        jsontxtreader_df.Read();
                        string subcategory_desc = jsontxtreader_df.Value.ToString();
                        desc = subcategory_desc;
                            
                        dogfood.Description = desc;
                        flag = true;
                    }
                }

                if (jsontxtreader_df.Value != null)
                {
                    object val_price = jsontxtreader_df.Value;
                    string strval_price = val_price.ToString();

                    if (strval_price.Equals("salePrice"))
                    {
                        read2 = true;
                        jsontxtreader_df.Read();
                        string subcategory_price = jsontxtreader_df.Value.ToString();
                        price = subcategory_price;

                        dogfood.Price = price;
                        flag = true;
                    }
                }

                if (jsontxtreader_df.Value != null)
                {
                    object val_image = jsontxtreader_df.Value;
                    string strval_image = val_image.ToString();

                    if (strval_image.Equals("thumbnailImage"))
                    {
                        read3 = true;
                        jsontxtreader_df.Read();
                        string subcategory_image = jsontxtreader_df.Value.ToString();
                        photo = subcategory_image;

                        dogfood.Photo = photo;
                        flag = true;
                    }
                }

                if (jsontxtreader_df.Value != null)
                {
                    object val_url = jsontxtreader_df.Value;
                    string strval_url = val_url.ToString();

                    if (strval_url.Equals("productUrl"))
                    {
                        read4 = true;
                        jsontxtreader_df.Read();
                        string subcategory_url = jsontxtreader_df.Value.ToString();
                        url = subcategory_url;

                        dogfood.Url = url;
                        flag = true;
                    }
                }
                
                if (flag == true && read1 == true && read2 == true && read3 == true && read4 == true)
                {
                    dogfood.Url = url;
                    dogfood.Description = desc;
                    dogfood.Price = "$" + price;
                    dogfood.Photo = photo;

                    listDogFood.Add(dogfood);

                    read1 = false;
                    read2 = false;
                    read3 = false;
                    read4 = false;
                    url = "";
                    desc = "";
                    photo = "";
                    price = "";
                    }
                    flag = false;

                }
                
            return listDogFood;
        }
    }
}