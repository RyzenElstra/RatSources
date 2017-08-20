using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;

namespace TrollRAT.Payloads
{
    public abstract class Payload
    {
        protected string name;
        public string Name => name;

        protected List<PayloadSetting> settings = new List<PayloadSetting>();
        public List<PayloadSetting> Settings => settings;

        protected List<PayloadAction> actions = new List<PayloadAction>();
        public List<PayloadAction> Actions => actions;

        public virtual void writeToStream(BinaryWriter writer)
        {
            foreach (PayloadSetting setting in settings)
            {
                setting.writeToStream(writer);
            }
        }

        public virtual void readFromStream(BinaryReader reader)
        {
            foreach (PayloadSetting setting in settings)
            {
                setting.readFromStream(reader);
            }
        }
    }

    public abstract class ExecutablePayload : Payload
    {
        protected abstract void execute();

        public ExecutablePayload()
        {
            actions.Add(new PayloadActionExecute(this));
        }

        public void Execute()
        {
            var thread = new Thread(new ThreadStart(execute));
            thread.Start();
        }
    }

    public abstract class LoopingPayload : ExecutablePayload
    {
        public static bool pausePayloads = false;

        protected bool running = false;
        public bool Running => running;

        private PayloadSettingNumber delay;
        public decimal Delay => delay.Value;

        protected int i;

        public LoopingPayload(int defaultDelay)
        {
            delay = new PayloadSettingNumber(defaultDelay, "Delay (in 1/100 seconds)", 1, 10000, 1);

            settings.Add(delay);
            actions.Add(new PayloadActionStartStop(this));

            var thread = new Thread(new ThreadStart(Loop));
            thread.Start();
        }

        public LoopingPayload() : this(100) { }

        public void Start()
        {
            running = true;
            i = 0;
        }

        public void Stop()
        {
            running = false;
        }

        private void Loop()
        {
            while (true)
            {
                if (running && !pausePayloads)
                {
                    execute();
                }

                for (i = (int)Delay; i >= 0; i--)
                    Thread.Sleep(10);
            }
        }

        public override void writeToStream(BinaryWriter writer)
        {
            base.writeToStream(writer);
            writer.Write(running);
        }

        public override void readFromStream(BinaryReader reader)
        {
            base.readFromStream(reader);
            running = reader.ReadBoolean();
        }
    }
}
