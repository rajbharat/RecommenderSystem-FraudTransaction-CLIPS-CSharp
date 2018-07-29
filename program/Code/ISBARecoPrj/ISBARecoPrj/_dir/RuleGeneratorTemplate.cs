using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using NVelocity.App;
using Commons.Collections;
using NVelocity.Runtime;
using NVelocity;
using NVelocity.Context;
using NVelocity.Exception;
using Velocity = NVelocity.App.Velocity;
using VelocityContext = NVelocity.VelocityContext;
using Template = NVelocity.Template;
using ParseErrorException = NVelocity.Exception.ParseErrorException;
using ResourceNotFoundException = NVelocity.Exception.ResourceNotFoundException;
using System.IO;

namespace ISBARecoPrj
{
     public class RuleGeneratorTemplate
    {
        private static Hashtable myVar = new Hashtable();

        public static Hashtable MyHT
        {
            get { return myVar; }
            set { myVar = value; }
        }

        public static StringWriter GetFileText(string path, Hashtable ht)
        {
            if (String.IsNullOrEmpty(path))
            {
                throw new ArgumentNullException("Argument Excception！");
            }
            try
            {
                string tmpPath = path.Substring(0, path.LastIndexOf(@"\"));
                string filePath = path.Substring(path.LastIndexOf(@"\") + 1);
               
                VelocityEngine velocity = new VelocityEngine();
                ExtendedProperties props = new ExtendedProperties();
                props.AddProperty(RuntimeConstants.RESOURCE_LOADER, "file");
                props.AddProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH, tmpPath);
                props.AddProperty(RuntimeConstants.FILE_RESOURCE_LOADER_CACHE, true);
                props.AddProperty(RuntimeConstants.INPUT_ENCODING, "utf-8");
                props.AddProperty(RuntimeConstants.OUTPUT_ENCODING, "utf-8");
                velocity.Init(props);

                Template temp = velocity.GetTemplate(filePath);
                IContext context = new VelocityContext();
                foreach (string key in ht.Keys)
                {
                    context.Put(key, ht[key]);
                }
                StringWriter writer = new StringWriter();
                temp.Merge(context, writer);
                
                return writer;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static String Run()
        {
            //string path = Directory.GetCurrentDirectory
            String S = GetFileText(@"C:\\ISBARecoPrj\\ISBARecoPrj\\template.vm", MyHT).ToString();
            Console.WriteLine(S);
            return S;
        }
    }
}
