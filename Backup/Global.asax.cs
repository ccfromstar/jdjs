using System;
using System.Timers;

namespace JDJS.Web
{
    public class Global : System.Web.HttpApplication
    {
        int NowTime = 1;
        protected void Application_Start(object sender, EventArgs e)
        {
            System.Timers.Timer timer = new System.Timers.Timer(360000);
            timer.AutoReset = true;
            timer.Enabled = true;
            timer.Elapsed += new System.Timers.ElapsedEventHandler(this.setTime);
            timer.Start();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        public void setTime(Object sender, ElapsedEventArgs e)
        {
            if (NowTime == 24)
            {
                NowTime = 1;
                JDJS.BLL.member_point bll = new BLL.member_point();
                bll.ClearCount();
            }
            else if (NowTime > 24)
            {
                NowTime = 1;
            }
            else
            {
                NowTime += 1;
            }
            if (DateTime.Now.DayOfYear == 1)
            {
                JDJS.BLL.member_point bll = new BLL.member_point();
                bll.ClearCount();
            }
        }
    }
}