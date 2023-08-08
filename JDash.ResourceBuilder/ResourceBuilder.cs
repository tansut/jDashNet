using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using JDash.Helpers;
//using 

namespace JDash.ResourceBuilder
{
    internal class ResourceBuilder
    {
        // Fields
        private const string assemblyCSSTemplate = "[assembly: WebResource(\"{1}{2}.{0}\", \"text/css\", PerformSubstitution = true)]";
        private const string assemblyGIFTemplate = "[assembly: WebResource(\"{1}{2}.{0}\", \"image/gif\")]";
        private const string assemblyJSTemplate = "[assembly: WebResource(\"{1}{2}.{0}\", \"text/javascript\")]";
        private const string assemblyPNGTemplate = "[assembly: WebResource(\"{1}{2}.{0}\", \"image/png\")]";
        private string projectType;
        private string assemblyRoot;
        private string[] goodFile;
        private ArrayList list = new ArrayList();
        private string root;
        private string[] skipFolders;
        private const string webresourceTemplate = "url(\"<%=WebResource(\"{1}{2}.{0}\")%>\")";


        private void AddToList(string value)
        {
            value = this.NormalizePath(value);
            if (!this.list.Contains(value))
            {
                this.list.Add(value);
            }
        }

        private void Embeddify(FileInfo file)
        {
            string str = file.FullName.RightOfRightmostOf(@"\"+projectType+"\\").Replace(@"\", ".");
            string extension = file.Extension;
            if (extension != null)
            {
                if (!(extension == ".js"))
                {
                    if (extension == ".css")
                    {
                        this.StripImagesFromCSS(file);
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"text/css\", PerformSubstitution = true)]", str, this.AssemblyRoot,this.projectType);
                    }
                    else if (extension == ".gif")
                    {
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"image/gif\")]", str, this.AssemblyRoot,this.projectType);
                    }
                    else if (extension == ".png")
                    {
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"image/png\")]", str, this.AssemblyRoot,this.projectType);
                    }
                    else if (extension == ".eot")
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/eot\")]", str, this.AssemblyRoot,this.projectType);
                    else if (extension == ".ttf")
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/ttf\")]", str, this.AssemblyRoot,this.projectType);
                    else if (extension == ".otf")
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/otf\")]", str, this.AssemblyRoot,this.projectType);
                    else if (extension == ".woff")
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/woff\")]", str, this.AssemblyRoot,this.projectType);
                    else if (extension == ".svg")
                        str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"image/svg+xml\")]", str, this.AssemblyRoot,this.projectType);
                }
                else
                {


                    str = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"text/javascript\")]", str, this.AssemblyRoot,this.projectType);
                }
            }
            this.AddToList(str);
        }

        public void FindFiles(string src)
        {
            string[] fileSystemEntries = Directory.GetFileSystemEntries(src);
            foreach (string str in fileSystemEntries)
            {
                if (Directory.Exists(str))
                {
                    DirectoryInfo info = new DirectoryInfo(str);
                    if (!this.IsMatch(info.Name, this.SkipFolders))
                    {
                        this.FindFiles(str);
                    }
                }
                else
                {
                    FileInfo file = new FileInfo(str);
                    if (this.IsMatch(file.Name.ToLower().RightOfRightmostOf('.'), this.GoodFile))
                    {
                        this.Embeddify(file);
                    }
                }
            }
        }


        private bool IsMatch(string value, string[] toMatch)
        {
            foreach (string str in toMatch)
            {
                if (value.Equals(str))
                {
                    return true;
                }
            }
            return false;
        }

        private static void Main(string[] args)
        {
            ResourceBuilder builder = new ResourceBuilder
            {
                root = args[0].Trim(),
                assemblyRoot = args[1],
                projectType=args[2]
            };
            try
            {
                builder.Start();
                builder.UpdateAssemblyInfo();
                //builder.UpdateIconEnum();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        private void MakeEmbeddedCSS(string path, string css, Dictionary<string, string> toMatch)
        {
            foreach (KeyValuePair<string, string> pair in toMatch)
            {
                css = css.Replace(pair.Key, string.Format("url(\"<%=WebResource(\"{1}{2}.{0}\")%>\")", pair.Value, this.AssemblyRoot,this.projectType));
            }
            path = path.LeftOfRightmostOf('.') + "-embedded." + path.RightOfRightmostOf('.');
            FileHelper.WriteFile(path, css);
        }

        public string NormalizePath(string value)
        {
            string str = value.LeftOfRightmostOf('.').LeftOfRightmostOf('.');
            string str2 = value.Substring(str.Length);
            return (str.Replace('-', '_') + str2);
        }


        private void Start()
        {
            this.goodFile = new string[] { "js", "css", "gif", "png", "otf", "eot", "svg", "ttf", "woff" };
            this.skipFolders = new string[] { ".svn", "source", "raw-images", "test", "src", "examples", "welcome", "theme-access", "theme-gray", "structure", "visual", "overview" };
            this.FindFiles(this.Root + @"\resources\");
        }

        private void StripImagesFromCSS(FileInfo file)
        {
            if (!file.Name.Contains("-embedded"))
            {
                Dictionary<string, string> toMatch = new Dictionary<string, string>();
                string input = FileHelper.ReadFile(file.FullName);
                foreach (Match match in Regex.Matches(input, "url\\([\"']?([^\\)]*?\\.(gif|png|otf|eot|svg|ttf|woff))[\"']?\\)"))
                {
                    if (!match.Value.Contains("foo.gif"))
                    {
                        string str2 = match.Value.ToLower().Replace(" ", "").Replace("url(", "").Replace("../", "").Replace(")", "").Replace("/", ".").Replace("'", "").Replace("\"", "");
                        if (str2.StartsWith("."))
                        {
                            str2 = str2.TrimStart(new char[] { '.' });
                        }
                        string str3 = "";
                        if (str2.StartsWith("resources."))
                        {
                            str2 = str2.Substring("resources.".Length);
                        }
                        string text = file.Directory.ToString();
                        var parts = text.Split(new string[] { "resources" }, StringSplitOptions.RemoveEmptyEntries);
                        str3 = "resources" + parts[1].Replace(@"\", ".");
                        str2 = str3 + "." + str2;
                        str2 = this.NormalizePath(str2);
                        if (!toMatch.ContainsKey(match.Value))
                        {
                            toMatch.Add(match.Value, str2);
                        }

                        var extension = str2.RightOfRightmostOf('.');
                        if (extension == "gif")
                        {
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"image/gif\")]", str2, this.AssemblyRoot,this.projectType);
                        }
                        else if (extension == "png")
                        {
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"image/png\")]", str2, this.AssemblyRoot,this.projectType);
                        }

                        else if (extension == "eot")
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"application/vnd.ms-fontobject\")]", str2, this.AssemblyRoot,this.projectType);
                        else if (extension == "ttf")
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"application/font/ttf\")]", str2, this.AssemblyRoot,this.projectType);
                        else if (extension == "otf")
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/opentype\")]", str2, this.AssemblyRoot,this.projectType);
                        else if (extension == "woff")
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/x-woff\")]", str2, this.AssemblyRoot,this.projectType);
                        else if (extension == "svg")
                            str2 = string.Format("[assembly: WebResource(\"{1}{2}.{0}\", \"font/x-woff\")]", str2, this.AssemblyRoot,this.projectType);

                        this.AddToList(str2);
                    }
                }
                this.MakeEmbeddedCSS(file.FullName, input, toMatch);
            }
        }

        private void UpdateAssemblyInfo()
        {
            string str = "/* "+projectType+" EMBEDDED RESOURCES */";
            string path = this.Root + @"\Properties\AssemblyInfo.cs";
            string str3 = FileHelper.ReadFile(path);
            string str5 = str3.Substring(0, str3.IndexOf(str)).Trim();
            str3 = str5 + Environment.NewLine + Environment.NewLine + str + Environment.NewLine + Environment.NewLine;
            this.list.Sort();
            StringBuilder builder = new StringBuilder(0x400);
            foreach (string str4 in this.list)
            {
                builder.Append(str4 + Environment.NewLine);
            }
            str3 = str3 + builder.ToString().Trim();
            FileHelper.WriteFile(path, str3);
        }

        //public void UpdateIconEnum()
        //{
        //    string str = "/****/";
        //    string path = @"..\..\Enums\Icon.cs";
        //    string text = FileHelper.ReadFile(path);
        //    string str4 = text.LeftOf(str);
        //    string str5 = text.RightOfRightmostOf(str);
        //    string[] fileSystemEntries = Directory.GetFileSystemEntries(this.Root + @"\Build\JDash.WebForms\icons\");
        //    StringBuilder builder = new StringBuilder();
        //    builder.Append(str4);
        //    builder.Append(str);
        //    builder.Append(Environment.NewLine);
        //    foreach (string str6 in fileSystemEntries)
        //    {
        //        FileInfo info = new FileInfo(str6);
        //        if (this.IsMatch(info.Name.ToLower().RightOfRightmostOf('.'), this.GoodFile))
        //        {
        //            builder.Append(Environment.NewLine);
        //            builder.Append("\t\t/// <summary>" + Environment.NewLine);
        //            builder.Append("\t\t///" + Environment.NewLine);
        //            builder.Append("\t\t/// </summary>" + Environment.NewLine);
        //            builder.Append("\t\t" + info.Name.LeftOfRightmostOf('.').Split(new char[] { '_' }).ToCamelCase() + "," + Environment.NewLine);
        //        }
        //    }
        //    builder.Replace(",", "", builder.Length - 4, 4);
        //    builder.Append("\t\t" + str);
        //    builder.Append(str5);
        //    FileHelper.WriteFile(path, builder.ToString().Trim());
        //}

        // Properties
        private string AssemblyRoot
        {
            get
            {
                return this.assemblyRoot;
            }
        }


        private string[] GoodFile
        {
            get
            {
                return this.goodFile;
            }
        }


        private string Root
        {
            get
            {
                return this.root;
            }
        }

        private string[] SkipFolders
        {
            get
            {
                return this.skipFolders;
            }
        }
    }

}
