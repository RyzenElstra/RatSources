using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace Argus___RAT
{
    /// <summary>
    /// Waits for Boot to start the MainService
    /// </summary>
    [BroadcastReceiver]
    [IntentFilter(new[] { Intent.ActionBootCompleted })]
    partial class BootReceiver : BroadcastReceiver
    {
        public override void OnReceive(Context context, Intent intent)
        {
            if (intent.Action == Intent.ActionBootCompleted)
            {         
                // Start the MainService
                context.ApplicationContext.StartService(new Intent(context, typeof(MainService)));

                // |-|-|-|- DEBUG -|-|-|-|
                // Toast.MakeText(context, "Started Service!", ToastLength.Long).Show();
            }
        }
    }
}