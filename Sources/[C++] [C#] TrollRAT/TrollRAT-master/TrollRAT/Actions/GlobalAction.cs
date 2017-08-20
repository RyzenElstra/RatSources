using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using TrollRAT.Server;
using TrollRAT.Utils;

namespace TrollRAT.Actions
{
    public interface GlobalAction
    {
        string getHTML(GlobalAction parent);
    }

    public abstract class GlobalActionServer : IDBase<GlobalActionServer>, GlobalAction
    {
        public virtual string Color => "default";
        public abstract string Title { get; }

        // Returns JavaScript to be executed by the client
        public abstract string execute();

        protected WebServer server;
        public WebServer Server => server;

        public static readonly List<GlobalActionServer> ServerActions = new List<GlobalActionServer>();

        public GlobalActionServer(WebServer server)
        {
            ServerActions.Add(this);
            this.server = server;
        }

        public virtual string getHTML(GlobalAction parent)
        {
            if (parent is GlobalActionDropdown)
            {
                return string.Format("<li><a href=\"#\" onclick=\"globalAction({0});\">{1}</a></li>",
                    id, Title, Color);
            }

            return string.Format("<button class=\"btn btn-{2} navbar-btn\" type=\"button\" onclick=\"globalAction({0});\">{1}</button>",
                id, Title, Color);
        }

        public virtual void writeToStream(BinaryWriter writer) { }
        public virtual void readFromStream(BinaryReader reader) { }
    }

    public abstract class GlobalActionClient : GlobalAction
    {
        public virtual string Color => "default";
        public abstract string Title { get; }
        public abstract string OnClick { get; }

        protected WebServer server;
        public WebServer Server => server;

        public GlobalActionClient(WebServer server)
        {
            this.server = server;
        }

        public virtual string getHTML(GlobalAction parent)
        {
            if (parent is GlobalActionDropdown)
            {
                return string.Format("<li><a href=\"#\" onclick=\"{0}\">{1}</a></li>",
                    OnClick, Title, Color);
            }

            return string.Format("<button class=\"btn btn-{2} navbar-btn\" type=\"button\" onclick=\"{0}\">{1}</button>",
                OnClick, Title, Color);
        }
    }

    public abstract class GlobalActionList : IDBase<GlobalActionList>, GlobalAction
    {
        protected List<GlobalAction> actions = new List<GlobalAction>();
        public List<GlobalAction> Actions => actions;

        public abstract string getHTML(GlobalAction parent);
    }

    public class GlobalActionDropdown : GlobalActionList
    {
        protected string color, title;
        public string Color => color;
        public string Title => title;

        public GlobalActionDropdown(string title, string color)
        {
            this.title = title;
            this.color = color;
        }

        public GlobalActionDropdown(string title) : this(title, "default") { }

        public override string getHTML(GlobalAction parent)
        {
            if (parent == null)
            {
                StringBuilder htmlBuilder = new StringBuilder();

                htmlBuilder.AppendLine("<span class=\"dropdown\">");
                htmlBuilder.AppendLine(String.Format("<button class=\"btn btn-{0} navbar-btn dropdown-toggle\" " +
                    "data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"type=\"button\" " +
                    "id=\"globalDropdown{2}\">{1} <span class=\"caret\"></span></button>", color, title, id));

                htmlBuilder.AppendLine(String.Format("<ul class=\"dropdown-menu\" aria-labelledby=\"globalDropdown{0}\">", id));

                foreach (GlobalAction action in actions)
                {
                    htmlBuilder.Append(action.getHTML(this));
                }

                htmlBuilder.AppendLine("</ul>");
                htmlBuilder.AppendLine("</span>");

                return htmlBuilder.ToString();
            }

            throw new ArgumentException("Parents for Dropdowns must be null!");
        }
    }
}
