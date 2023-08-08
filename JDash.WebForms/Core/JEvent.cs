using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JDash.Models;
using JDash.WebForms.Utils;

namespace JDash.WebForms
{
    /// <summary>
    /// Represents an event.
    /// </summary>
    public class JEvent
    {
        public const string InitContext = "_InitDashlet";
        public const string DeleteDashlet = "deleteDashlet";

        public const string Maximize = "maximize";
        public const string Restore = "restore";
        public const string Collapse = "collapse";
        public const string Refresh = "refresh";
        public const string Remove = "remove";


        public const string PreMaximize = "pre-maximize";
        public const string PreRestore = "pre-restore";
        public const string PreCollapse = "pre-collapse";
        public const string PreRefresh = "pre-refresh";
        public const string PreRemove = "pre-remove";



        public const string UpdateDashletPositions = "updateDashletPositions";
        public const string SaveDashlet = "saveDashlet";
        public const string SaveDashboard = "saveDashboard";
        public const string OpenDashletEditor = "openDashletEditor";
        public const string CancelDashletEditor = "cancelDashletEditor";
        public const string ValidateDashletEditor = "validateDashletEditor";
        public const string CreateDashlet= "createDashlet";
        public const string GetDashletModule = "getDashletModule";
        public const string CommandExecuting = "commandExecuting";
        public const string CommandExecuted = "commandExecuted";
        public const string ChangeDashboardLayout = "changeDashboardLayout";

        

        
        




        public static JEvent FromJson(string json)
        {
            var instance = SerializationUtils.Deserialize<JEvent>(json);
            if (string.IsNullOrWhiteSpace(instance.BroadcastName))
                instance.BroadcastName = instance.Name;
            return instance;
        }

        public string Name { get; set; }
        public Config Parameters { get; set; }
        public object Origin { get; internal set; }
        internal string BroadcastName { get; set; }

        internal JEvent(string name, Config paramaters, object origin, string broadcastName)
        {
            this.Parameters = paramaters == null ? new Config() : paramaters;
            this.Name = name;
            this.Origin = origin;
            this.BroadcastName = broadcastName;
        }

        public JEvent(string name, Config paramaters, object origin): this(name, paramaters, origin, name)
        {
        }

        public JEvent()
        {

        }


        public JEvent(string name)
            : this(name, null, null)
        {

        }

        public JEvent(string name, Config parameters)
            : this(name, parameters, null)
        {

        }

        public static JEvent NewBindDashletEvent()
        {
            return new JEvent(JEvent.Refresh);
        }

        public static JEvent NewInitContextEvent()
        {
            return new JEvent(JEvent.InitContext);
        }
    }

    public class JEventArgs : EventArgs
    {
        private static JEventArgs empty;

        static JEventArgs() {
            var ewt = new JEvent(string.Empty, new Config());
            empty = new JEventArgs(ewt);    
        }

        public static new JEventArgs Empty
        {
            get
            {
                return empty;
            }
        }

        public JEvent Event { get; private set; }
        public bool Handled { get; set; }
        public bool Rejected { get; set; }

        public JEventArgs(JEvent Event)
        {
            this.Event = Event;

        }
    }

    [AttributeUsage(AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public sealed class JEventHandlerAttribute : Attribute
    {
        public readonly string Name;

        public JEventHandlerAttribute(string name)
        {
            this.Name = name;
        }

    }
}
