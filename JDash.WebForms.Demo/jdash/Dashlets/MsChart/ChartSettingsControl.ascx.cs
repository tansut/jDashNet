/*  ----------------------------------------------------------------------------
 *  Kalitte Professional Information Technologies
 *  ----------------------------------------------------------------------------
 *  Dynamic Dashboards
 *  ----------------------------------------------------------------------------
 *  File:       ChartSettingsControl.ascx.cs
 *  ----------------------------------------------------------------------------
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace JDash.WebForms.Demo.Jdash.Dashlets.MsChart
{
    [Serializable]
    public class MsChartSettings
    {
        public static MsChartSettings Default
        {
            get
            {
                MsChartSettings defaultSettings = new MsChartSettings();
                defaultSettings.BackColor = "White";
                defaultSettings.Width = 360;
                defaultSettings.Height = 360;
                defaultSettings.SecondaryBackColor = "White";
                defaultSettings.BorderSkin = BorderSkinStyle.None.ToString();
                defaultSettings.Gradient = GradientStyle.None.ToString();
                defaultSettings.Palette = ChartColorPalette.BrightPastel.ToString();
                defaultSettings.IsClustured = true;
                defaultSettings.ChartType = (int)SeriesChartType.Bar;
                defaultSettings.AlphaLevel = 128;
                defaultSettings.HasBorderColor = true;
                return defaultSettings;
            }
        }

        public object ChartKey { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }

        public string BackColor { get; set; }
        public string Gradient { get; set; }
        public string SecondaryBackColor { get; set; }
        public string AreaBackColor { get; set; }
        public string AreaGradient { get; set; }
        public string AreaSecondaryBackColor { get; set; }
        public string Palette { get; set; }
        public string BorderSkin { get; set; }
        public bool IsClustured { get; set; }
        public int AlphaLevel { get; set; }
        public string MarkerStyle { get; set; }
        public int MarkerSize { get; set; }
        public bool HasBorderColor { get; set; }
        public bool ShowMarkersLine { get; set; }
        public bool CollectPieOther { get; set; }
        public int CollectedPieTreshold { get; set; }

        public bool Enable3D { get; set; }
        public int ChartType { get; set; }
        public string Title { get; set; }
        public string TitleAlignment { get; set; }

        public bool LegendsEnabled { get; set; }
        public string LegendStyle { get; set; }
        public string LegendDocking { get; set; }
        public string LegendAlignment { get; set; }

        public bool IsShownValues { get; set; }
        public string PieLabelStyle { get; set; }
        public string PieDrawingStyle { get; set; }
        public int SeriesCount { get; set; }
        public string Description { get; set; }
        public bool ShowLabels { get; set; }

    }

    public partial class ChartSettingsControl : System.Web.UI.UserControl
    {



        private void LoadChartTypes()
        {
            ctlChartType.Items.Add(new ListItem("Bubble", "2"));
            ctlChartType.Items.Add(new ListItem("Line", "3"));
            ctlChartType.Items.Add(new ListItem("Spline", "4"));
            ctlChartType.Items.Add(new ListItem("StepLine", "5"));
            ctlChartType.Items.Add(new ListItem("Bar", "7"));
            ctlChartType.Items.Add(new ListItem("Column", "10"));
            ctlChartType.Items.Add(new ListItem("Area", "13"));
            ctlChartType.Items.Add(new ListItem("SplineArea", "14"));
            ctlChartType.Items.Add(new ListItem("Pie", "17"));
            ctlChartType.Items.Add(new ListItem("Doughnut", "18"));
            ctlChartType.Items.Add(new ListItem("Funnel", "33"));

            ctlChartType.SelectedValue = "3";
        }

        private void LoadPieLabelStyles()
        {
            ctlPieLabelStyle.Items.Add(new ListItem("Disabled", "Disabled"));
            ctlPieLabelStyle.Items.Add(new ListItem("Inside", "Inside"));
            ctlPieLabelStyle.Items.Add(new ListItem("Outside", "Outside"));

            ctlPieLabelStyle.SelectedValue = "Disabled";
        }

        private void LoadPieDrawingStyles()
        {
            ctlPieDrawingStyle.Items.Add(new ListItem("Default", "Default"));
            ctlPieDrawingStyle.Items.Add(new ListItem("Soft Edge", "SoftEdge"));
            ctlPieDrawingStyle.Items.Add(new ListItem("Concave", "Concave"));

            ctlPieDrawingStyle.SelectedValue = "Default";
        }

        private void LoadBackColors()
        {
            foreach (var item in Enum.GetNames(typeof(KnownColor)).OrderBy(p => p))
            {
                ListItem l = new ListItem(item, item);
                //l.Selected = (item == "White");

                ctlBackColor.Items.Add(l);
            }


        }

        private void LoadSecondaryBackColors()
        {
            foreach (var item in Enum.GetNames(typeof(KnownColor)).OrderBy(p => p))
            {
                ctlSecondaryBackColor.Items.Add(new ListItem(item, item));
            }

            ctlSecondaryBackColor.SelectedValue = "White";
        }

        private void LoadGradiants()
        {
            foreach (string colorName in Enum.GetNames(typeof(GradientStyle)).OrderBy(p => p))
            {
                ctlGradient.Items.Add(new ListItem(colorName, colorName));
            }

            ctlGradient.SelectedValue = "None";
        }

        private void LoadBorderSkin()
        {
            foreach (var item in Enum.GetNames(typeof(BorderSkinStyle)).OrderBy(p => p))
            {
                ctlBorderSkin.Items.Add(new ListItem(item, item));
            }

            ctlBorderSkin.SelectedValue = "None";
        }


        private void LoadPalettes()
        {
            foreach (var item in Enum.GetNames(typeof(ChartColorPalette)).OrderBy(p => p))
            {
                ctlPalette.Items.Add(new ListItem(item, item));
            }

            ctlPalette.SelectedValue = "None";
        }

        private void LoadMarkerStyles()
        {
            foreach (var item in Enum.GetNames(typeof(MarkerStyle)))
            {
                ctlMarkerStyle.Items.Add(new ListItem(item, item));
            }

            ctlMarkerStyle.SelectedValue = "None";
        }

        private void LoadMarkerSize()
        {
            ctlMarkerSize.Items.Add(new ListItem("0", "0"));
            ctlMarkerSize.Items.Add(new ListItem("5", "5"));
            ctlMarkerSize.Items.Add(new ListItem("10", "10"));
            ctlMarkerSize.Items.Add(new ListItem("15", "15"));
            ctlMarkerSize.Items.Add(new ListItem("20", "20"));

            ctlMarkerSize.SelectedValue = "0";
        }

        private void LoadAlphaLevels()
        {
            ctlAlphaLevel.Items.Add(new ListItem("None", "255"));
            ctlAlphaLevel.Items.Add(new ListItem("Low", "192"));
            ctlAlphaLevel.Items.Add(new ListItem("Midium", "128"));
            ctlAlphaLevel.Items.Add(new ListItem("High", "64"));

            ctlAlphaLevel.SelectedValue = "255";
        }

        private void LoadCollectedTresholds()
        {
            ctlCollectedPieTreshold.Items.Add(new ListItem("None", "0"));
            ctlCollectedPieTreshold.Items.Add(new ListItem("5", "5"));
            ctlCollectedPieTreshold.Items.Add(new ListItem("10", "10"));
            ctlCollectedPieTreshold.Items.Add(new ListItem("15", "15"));
            ctlCollectedPieTreshold.Items.Add(new ListItem("20", "20"));

            ctlCollectedPieTreshold.SelectedValue = "0";
        }

        private void LoadTitleAlignments()
        {
            foreach (var item in Enum.GetNames(typeof(ContentAlignment)))
            {
                ctlTitleAlignment.Items.Add(new ListItem(item, item));
            }

            ctlTitleAlignment.SelectedValue = ContentAlignment.TopCenter.ToString();
        }

        private void LoadLegendStyles()
        {
            foreach (var item in Enum.GetNames(typeof(LegendStyle)))
            {
                ctlLegendStyle.Items.Add(new ListItem(item, item));
            }
            ctlLegendStyle.SelectedValue = LegendStyle.Column.ToString();
        }

        private void LoadLegendDocking()
        {
            foreach (var item in Enum.GetNames(typeof(Docking)))
            {
                ctlLegendDocking.Items.Add(new ListItem(item, item));
            }
            ctlLegendDocking.SelectedValue = Docking.Bottom.ToString();
        }

        private void LoadLegendAlignment()
        {
            foreach (var item in Enum.GetNames(typeof(StringAlignment)))
            {
                ctlLegendAlignment.Items.Add(new ListItem(item, item));
            }
            ctlLegendAlignment.SelectedValue = StringAlignment.Center.ToString();
        }


        public MsChartSettings DoEdit(MsChartSettings settings)
        {
            LoadChartTypes();
            LoadPieDrawingStyles();
            LoadPieLabelStyles();
            LoadBackColors();
            LoadSecondaryBackColors();
            LoadGradiants();
            LoadBorderSkin();
            LoadPalettes();
            LoadMarkerStyles();
            LoadMarkerSize();
            LoadAlphaLevels();
            LoadCollectedTresholds();
            LoadTitleAlignments();
            LoadLegendAlignment();
            LoadLegendDocking();
            LoadLegendStyles();

            if (settings == null)
                settings = MsChartSettings.Default;

            this.ToUIGeneralInfo(settings);
            this.ToUIApperanceInfo(settings);
            this.ToUITypeInfo(settings);
            this.ToUIOtherInfo(settings);


            return settings;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        internal MsChartSettings EndEdit(MsChartSettings settings)
        {
            if (settings == null)
            {
                settings = new MsChartSettings();
            }

            this.ToEntityGeneralInfo(settings);
            this.ToEntityApperanceInfo(settings);
            this.ToEntityTypeInfo(settings);
            this.ToEntityOtherInfo(settings);

            return settings;
        }

        private void ToEntityGeneralInfo(MsChartSettings settings)
        {
            settings.Title = ctlTitle.Text;
            settings.Width = string.IsNullOrEmpty(ctlWidth.Text) ? 360 : int.Parse(ctlWidth.Text);
            settings.Height = string.IsNullOrEmpty(ctlHeight.Text) ? 360 : int.Parse(ctlHeight.Text);
            if (settings.Width <= 0)
                settings.Width = 360;
            if (settings.Height <= 0)
                settings.Height = 360;

            settings.TitleAlignment = ctlTitleAlignment.SelectedValue;
            settings.LegendsEnabled = ctlLegendEnabled.Checked;

            if (ctlLegendEnabled.Checked)
            {
                settings.LegendAlignment = ctlLegendAlignment.SelectedValue;
                settings.LegendStyle = ctlLegendStyle.SelectedValue;
                settings.LegendDocking = ctlLegendDocking.SelectedValue;
            }

        }

        private void ToEntityApperanceInfo(MsChartSettings settings)
        {
            settings.BackColor = ctlBackColor.SelectedValue;
            settings.SecondaryBackColor = ctlSecondaryBackColor.SelectedValue;
            settings.Gradient = ctlGradient.SelectedValue;
            settings.BorderSkin = ctlBorderSkin.SelectedValue;
            settings.Palette = ctlPalette.SelectedValue;
        }

        private void ToEntityTypeInfo(MsChartSettings settings)
        {
            settings.ChartType = int.Parse(ctlChartType.SelectedValue);
            settings.Enable3D = ctlEnable3D.Checked;

            if (this.IsPieChartsSelected)
            {
                settings.PieLabelStyle = ctlPieLabelStyle.SelectedValue;
                settings.PieDrawingStyle = ctlPieDrawingStyle.SelectedValue;

                settings.CollectPieOther = ctlCollectPieOther.Checked;

                if (ctlCollectPieOther.Checked)
                {
                    settings.CollectedPieTreshold = string.IsNullOrEmpty(ctlCollectedPieTreshold.SelectedValue) ? 0 : int.Parse(ctlCollectedPieTreshold.SelectedValue);
                }
            }

            settings.IsClustured = ctlIsClustered.Checked;
            settings.AlphaLevel = int.Parse(ctlAlphaLevel.SelectedValue);
            settings.HasBorderColor = ctlHasBorderColor.Checked;
        }

        private void ToEntityOtherInfo(MsChartSettings settings)
        {
            settings.LegendsEnabled = ctlLegendEnabled.Checked;
            settings.IsShownValues = ctlIsShownValues.Checked;
            settings.MarkerStyle = ctlMarkerStyle.SelectedValue;
            settings.MarkerSize = int.Parse(ctlMarkerSize.SelectedValue);
            settings.ShowMarkersLine = ctlShowMarkersLine.Checked;
            settings.Description = ctlDescription.Text;
            settings.ShowLabels = ctlShowLabels.Checked;
        }

        //ToUI

        private void ToUIGeneralInfo(MsChartSettings settings)
        {
            ctlTitle.Text = settings.Title;
            ctlWidth.Text = settings.Width.ToString();
            ctlHeight.Text = settings.Height.ToString();
            if (!string.IsNullOrEmpty(settings.TitleAlignment))
                ctlTitleAlignment.SelectedValue = settings.TitleAlignment;
            ctlLegendEnabled.Checked = settings.LegendsEnabled;

            if (ctlLegendEnabled.Checked)
            {
                ctlLegendAlignment.Enabled = true;
                ctlLegendDocking.Enabled = true;
                ctlLegendStyle.Enabled = true;
            }
            else
            {
                ctlLegendAlignment.Enabled = false;
                ctlLegendDocking.Enabled = false;
                ctlLegendStyle.Enabled = false;
            }
            if (!string.IsNullOrEmpty(settings.LegendAlignment))
                ctlLegendAlignment.SelectedValue = settings.LegendAlignment;
            if (!string.IsNullOrEmpty(settings.LegendDocking))
                ctlLegendDocking.SelectedValue = settings.LegendDocking;
            if (!string.IsNullOrEmpty(settings.LegendStyle))
                ctlLegendStyle.SelectedValue = settings.LegendStyle;
        }

        private void ToUIApperanceInfo(MsChartSettings settings)
        {
            if (!string.IsNullOrEmpty(settings.BackColor))
                ctlBackColor.SelectedValue = string.IsNullOrEmpty(settings.BackColor) ? ctlBackColor.SelectedValue : settings.BackColor;
            if (!string.IsNullOrEmpty(settings.SecondaryBackColor))
                ctlSecondaryBackColor.SelectedValue = string.IsNullOrEmpty(settings.SecondaryBackColor) ? ctlSecondaryBackColor.SelectedValue : settings.SecondaryBackColor;
            if (!string.IsNullOrEmpty(settings.Gradient))
                ctlGradient.SelectedValue = string.IsNullOrEmpty(settings.Gradient) ? ctlGradient.SelectedValue : settings.Gradient;
            if (!string.IsNullOrEmpty(settings.BorderSkin))
                ctlBorderSkin.SelectedValue = string.IsNullOrEmpty(settings.BorderSkin) ? ctlBorderSkin.SelectedValue : settings.BorderSkin;
            if (!string.IsNullOrEmpty(settings.Palette))
                ctlPalette.SelectedValue = string.IsNullOrEmpty(settings.Palette) ? ctlPalette.SelectedValue : settings.Palette;
        }

        private void ToUITypeInfo(MsChartSettings settings)
        {
            ctlChartType.SelectedValue = settings.ChartType.ToString();
            ctlEnable3D.Checked = settings.Enable3D;

            if (IsPieChartsSelected)
            {
                ctlPieDrawingStyle.Enabled = true;
                ctlPieLabelStyle.Enabled = true;
                ctlCollectPieOther.Enabled = true;
                ctlCollectedPieTreshold.Enabled = true;
            }
            else
            {
                ctlPieDrawingStyle.Enabled = false;
                ctlPieLabelStyle.Enabled = false;
                ctlCollectPieOther.Enabled = false;
                ctlCollectedPieTreshold.Enabled = false;
            }

            ctlPieLabelStyle.SelectedValue = string.IsNullOrEmpty(settings.PieLabelStyle) ? null : settings.PieLabelStyle.ToString();
            ctlPieDrawingStyle.SelectedValue = string.IsNullOrEmpty(settings.PieDrawingStyle) ? null : settings.PieDrawingStyle.ToString();
            ctlCollectPieOther.Checked = settings.CollectPieOther;
            ctlCollectedPieTreshold.SelectedValue = settings.CollectedPieTreshold.ToString();

            ctlIsClustered.Checked = settings.IsClustured;
            ctlAlphaLevel.SelectedValue = settings.AlphaLevel.ToString();
            ctlHasBorderColor.Checked = settings.HasBorderColor;
        }

        private void ToUIOtherInfo(MsChartSettings settings)
        {
            ctlLegendEnabled.Checked = settings.LegendsEnabled;
            ctlIsShownValues.Checked = settings.IsShownValues;
            ctlMarkerStyle.SelectedValue = settings.MarkerStyle;
            ctlMarkerSize.SelectedValue = settings.MarkerSize.ToString();
            ctlShowMarkersLine.Checked = settings.ShowMarkersLine;
            ctlDescription.Text = settings.Description;
            ctlShowLabels.Checked = settings.ShowLabels;
        }

        protected void ctlChartType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.IsPieChartsSelected)
            {
                ctlPieDrawingStyle.Enabled = true;
                ctlPieLabelStyle.Enabled = true;
                ctlCollectPieOther.Enabled = true;
                ctlCollectedPieTreshold.Enabled = true;
            }
            else
            {
                ctlPieDrawingStyle.Enabled = false;
                ctlPieLabelStyle.Enabled = false;
                ctlCollectPieOther.Enabled = false;
                ctlCollectedPieTreshold.Enabled = false;
            }
        }

        private bool IsPieChartsSelected
        {
            get
            {
                bool ret = false;

                if ((int.Parse(ctlChartType.SelectedItem.Value) == (int)SeriesChartType.Pie)
                || (int.Parse(ctlChartType.SelectedItem.Value) == (int)SeriesChartType.Doughnut)
                || (int.Parse(ctlChartType.SelectedItem.Value) == (int)SeriesChartType.Funnel))
                {
                    ret = true;
                }

                return ret;
            }
        }

        protected void ctlCollectPieOther_CheckedChanged(object sender, EventArgs e)
        {
            ctlCollectedPieTreshold.Enabled = ctlCollectPieOther.Checked;
        }

        protected void ctlLegendEnabled_CheckedChanged(object sender, EventArgs e)
        {
            ctlLegendAlignment.Enabled = ctlLegendEnabled.Checked;
            ctlLegendStyle.Enabled = ctlLegendEnabled.Checked;
            ctlLegendDocking.Enabled = ctlLegendEnabled.Checked;
        }


    }
}
