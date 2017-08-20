using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using TrollRAT.Utils;

namespace TrollRAT.Payloads
{
    public abstract class PayloadSetting : IDBase<PayloadSetting>
    {
        public abstract void writeHTML(StringBuilder builder);
        public abstract void readData(string str);

        public virtual void writeToStream(BinaryWriter writer)
        {
            //writer.Write(id);
        }

        public virtual void readFromStream(BinaryReader reader)
        {
            //id = reader.ReadInt32();
        }
    }

    public abstract class PayloadSetting<t> : PayloadSetting
    {
        public delegate void PayloadSettingChangeEvent(object sender, t newValue);
        public event PayloadSettingChangeEvent SettingChanged;

        protected t value;
        public t Value
        {
            get { return value; }
            set
            {
                if (isValid(value))
                {
                    this.value = value;
                    SettingChanged(this, value);
                }
            }
        }

        public PayloadSetting(t defaultValue) : base()
        {
            value = defaultValue;
        }

        public virtual bool isValid(t v)
        {
            return true;
        }

        public virtual void writeValueToStream(BinaryWriter writer)
        {
            foreach (MethodInfo method in writer.GetType().GetMethods())
            {
                if (method.Name == "Write" && method.GetParameters()[0].ParameterType == typeof(t))
                {
                    method.Invoke(writer, new object[] { value });
                    return;
                }
            }

            throw new NotImplementedException("The value type is not suported by BinaryWriter. Please override the writeValueToStream method.");
        }

        public virtual void readValueFromStream(BinaryReader reader)
        {
            foreach (MethodInfo method in reader.GetType().GetMethods())
            {
                if (method.Name.StartsWith("Read") && method.Name != "Read" && method.ReturnType == typeof(t))
                {
                    Value = (t)method.Invoke(reader, new object[0]);
                    return;
                }
            }

            throw new NotImplementedException("The value type is not suported by BinaryReader. Please override the readValueFromStream method.");
        }

        public override void writeToStream(BinaryWriter writer)
        {
            base.writeToStream(writer);
            writeValueToStream(writer);
        }

        public override void readFromStream(BinaryReader reader)
        {
            base.readFromStream(reader);
            readValueFromStream(reader);
        }
    }

    public abstract class TitledPayloadSetting<t> : PayloadSetting<t>
    {
        protected string title;
        public string Title => title;

        public TitledPayloadSetting(t defaultValue, string title) : base(defaultValue)
        {
            this.title = title;
        }
    }

    public class PayloadSettingNumber : TitledPayloadSetting<decimal>
    {
        protected decimal min, max, step;
        public decimal Min => min;
        public decimal Max => max;
        public decimal Step => step;

        public PayloadSettingNumber(decimal defaultValue, string title, decimal min, decimal max, decimal step) : base(defaultValue, title)
        {
            this.min = min;
            this.max = max;
            this.step = step;
        }

        public override void writeHTML(StringBuilder builder)
        {
            builder.Append(String.Format("<div class=\"form-group\"><label for=\"id{5}\">{0}</label><input id=\"id{5}\" " +
                "class=\"form-control\" type=\"number\"min=\"{1}\" max=\"{2}\" step=\"{3}\" value=\"{4}\" " +
                "oninput=\"setSetting({5}, this.value);\"></input></div>",
                title, min, max, step, value, id));
        }

        public override void readData(string str)
        {
            try
            {
                decimal i = decimal.Parse(str);
                Value = i;
            }
            catch (Exception) { }
        }

        public override bool isValid(decimal v)
        {
            return (v <= max && v >= min);
        }
    }

    public class PayloadSettingString : TitledPayloadSetting<string>
    {
        public PayloadSettingString(string defaultValue, string title) : base(defaultValue, title) { }

        public override void writeHTML(StringBuilder builder)
        {
            builder.Append(String.Format("<div class=\"form-group\"><label for=\"id{1}\">{0}</label><input id=\"id{1}\" " +
                "class=\"form-control\" type=\"text\" value=\"{2}\" " +
                "oninput=\"setSetting({1}, this.value);\"></input></div>",
                title, id, value));
        }

        public override void readData(string str)
        {
            value = str;
        }
    }

    public abstract class PayloadSettingSelectBase : TitledPayloadSetting<int>
    {
        public abstract string[] Options { get; set; }
        public string ValueText => Options[value];

        public PayloadSettingSelectBase(int defaultValue, string title) : base(defaultValue, title) { }

        public override void writeHTML(StringBuilder builder)
        {
            builder.Append(String.Format("<div class=\"form-group\"><label for=\"id{1}\">{0}</label><select id=\"id{1}\" " +
                "class=\"form-control\" onchange=\"setSetting({1}, this.selectedIndex);\">",
                title, id, value));

            string[] options = Options;
            for (int i = 0; i < options.Length; i++)
            {
                builder.Append((i == value ? "<option selected=\"selected\">" : "<option>") + options[i] + "</option>");
            }

            builder.Append("</select></div>");
        }

        public override void readData(string str)
        {
            try
            {
                int i = int.Parse(str);
                Value = i;
            }
            catch (Exception) { }
        }

        public override bool isValid(int v)
        {
            return (v >= 0 && v < Options.Length);
        }
    }

    public class PayloadSettingSelect : PayloadSettingSelectBase
    {
        protected string[] options;

        public override string[] Options
        {
            get { return options; }
            set { options = value; }
        }

        public PayloadSettingSelect(int defaultValue, string title, string[] options) : base(defaultValue, title)
        {
            this.options = options;
        }
    }

    public class PayloadSettingSelectFile : PayloadSettingSelectBase
    {
        protected string pattern, baseDirectory;

        public PayloadSettingSelectFile(int defaultValue, string title, string baseDirectory, string pattern = null) : base(defaultValue, title)
        {
            this.pattern = pattern;
            this.baseDirectory = baseDirectory;
        }

        public override string[] Options
        {
            get
            {
                try
                {
                    if (pattern == null)
                        return Directory.GetFiles(baseDirectory);
                    else
                        return Directory.GetFiles(baseDirectory, pattern);
                } catch (Exception) {
                    return new string[0];
                }
            }
            set { throw new NotSupportedException(); }
        }

        public string selectedFilePath => Path.Combine(baseDirectory, ValueText);
    }
}
