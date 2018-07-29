using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ISBARecoPrj
{
    static class Extensions
    {
        public static List<TEntity> ToList<TEntity>(this DataTable dataTable, Dictionary<string, string> mapping) where TEntity : new()
        {
            var list = new List<TEntity>();
            foreach (DataRow dataRow in dataTable.Rows)
            {
                var entity = new TEntity();
                foreach (var keyvaluePair in mapping)
                {
                    var property = entity.GetType().GetProperty(keyvaluePair.Key,
                                    BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance);
                    if (dataRow[keyvaluePair.Value] != DBNull.Value)
                    {
                        var propertyType =
                            Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
                        var value =
                            Convert.ChangeType(dataRow[keyvaluePair.Value], propertyType);
                        property.SetValue(entity, value, null);
                    }
                }

                list.Add(entity);
            }

            return list;
        }

        public static void Truncate<TEntity>(this Table<TEntity> table) where TEntity : class
        {
            var rowType = table.GetType().GetGenericArguments()[0];
            var tableName = table.Context.Mapping.GetTable(rowType).TableName;
            var sqlCommand = String.Format("truncate table {0}", tableName);
            table.Context.ExecuteCommand(sqlCommand);
        }

        public static List<TEntity> ToList<TEntity>(this DataTable dataTable) where TEntity : new()
        {
            List<TEntity> genericList = new List<TEntity>();
            Type entity = typeof(TEntity);
            PropertyInfo[] pi = entity.GetProperties();
            foreach (DataRow row in dataTable.Rows)
            {
                object defaultInstance = Activator.CreateInstance(entity);
             
                foreach (PropertyInfo prop in pi)
                {
                    try
                    {
                        //Get the value of the row according to the field name
                        //Remember that the classïs members and the tableïs field names
                        //must be identical
                        object columnvalue = row[prop.Name];
                        //Know check if the value is null. 
                        //If not, it will be added to the instance
                        if (columnvalue != DBNull.Value)
                        {
                            //Set the value dinamically. Now you need to pass as an argument
                            //an instance class of the generic class. This instance has been
                            //created with Activator.CreateInstance(t)
                            var propertyType = Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType;
                            var value = Convert.ChangeType(columnvalue, propertyType);
                            prop.SetValue(defaultInstance, value, null);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(prop.Name + ": " + ex.ToString());
                        return null;
                    }
                }
                //Now, create a class of the same type of the generic class. 
                //Then a conversion itïs done to set the value
                TEntity myclass = (TEntity)defaultInstance;
                //Add the generic instance to the generic list
                genericList.Add(myclass);
            }
            //At this moment, the generic list contains all de datatable values
            return genericList;
        }

    
            public static void WriteToCsvFile(this DataTable dataTable, string filePath)
            {
                StringBuilder fileContent = new StringBuilder();

                foreach (var col in dataTable.Columns)
                {
                    fileContent.Append(col.ToString() + ",");
                }

                fileContent.Replace(",", System.Environment.NewLine, fileContent.Length - 1, 1);

                foreach (DataRow dr in dataTable.Rows)
                {

                    foreach (var column in dr.ItemArray)
                    {
                        fileContent.Append("\"" + column.ToString() + "\",");
                    }

                    fileContent.Replace(",", System.Environment.NewLine, fileContent.Length - 1, 1);
                }

                System.IO.File.WriteAllText(filePath, fileContent.ToString());

            }
        
    }

}

