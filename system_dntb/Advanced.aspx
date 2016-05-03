<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="DotNetTextBox" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ϴ����ܸ߼�����</title>
    <link href="stylesheet.css" rel="stylesheet" type="text/css" />
    <base target="_self" />
    <script runat=server language="C#">
        DotNetTextBox.doctextboxdb boxdb, _db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bind();
            }

        }
        protected void bind()
        {
            boxdb = new doctextboxdb();
            _db = new doctextboxdb();
            Response.Expires = -1;
            System.Collections.ArrayList mylist;
            if (Request.Cookies["uploadConfig"] != null)
            {
                //��ȡ�����ļ�����
                mylist = boxdb.get_the_xmlmessage(Request.Cookies["uploadConfig"].Value.ToLower());

            }
            else
            {
                mylist = boxdb.get_the_xmlmessage(HttpContext.Current.Request.PhysicalApplicationPath + "/system_dntb/uploadconfig/default.config");
            }

            //��ȡ������������
            System.Collections.ArrayList _list = _db.get_the_xmlmessage(Server.MapPath("Advanced.config"));

            //�ж��ϴ��ļ��е������ÿռ��Ƿ�����
            if (_list[1].ToString().Equals("0"))
            {
                this.maxAllUploadSize.Enabled = false;
                RangeValidator1.Enabled = false;
                this.Button3.Enabled = false;
            }
            //�ж������ϴ��ļ����������ߴ��Ƿ�����
            if (_list[2].ToString().Equals("0"))
            {
                this.maxSingleUploadSize.Enabled = false;
                RangeValidator2.Enabled = false;
                this.Button1.Enabled = false;
            }
            //�ж������ϴ��ļ��Ƿ��Զ������Ƿ�����
            if (_list[3].ToString().Equals("0"))
            {
                this.autoname.Enabled = false;
                Button4.Enabled = false;
            }
            //�ж������Ƿ������ϴ��Ƿ�����
            if (_list[4].ToString().Equals("0"))
            {
                this.allowUpload.Enabled = false;
                this.Button5.Enabled = false;
            }
            //�Ƿ����ϴ���������ˮӡѡ���Ƿ�����
            if (_list[5].ToString().Equals("0"))
            {
                this.watermarkOption.Enabled = false;
                this.Button6.Enabled = false;
            }
            //�ж��Ƿ������ϴ�ͼƬ������ˮӡ�Ƿ�����
            if (_list[6].ToString().Equals("0"))
            {
                this.watermark.Enabled = false;
                this.Button7.Enabled = false;
            }
            //��������ˮӡ���Ƿ���ԭ�����½������Ƿ�����
            if (_list[7].ToString().Equals("0"))
            {
                this.watermarkName.Enabled = false;
                this.Button8.Enabled = false;
            }
            //����ˮӡ�����Ƿ�����
            if (_list[8].ToString().Equals("0"))
            {
                this.watermarkText.Enabled = false;
                this.Button9.Enabled = false;
            }
            //�Ƿ������ϴ�ͼƬ��ͼƬˮӡ�Ƿ�����
            if (_list[9].ToString().Equals("0"))
            {
                this.watermarkImages.Enabled = false;
                this.Button10.Enabled = false;
            }
            //����ͼƬˮӡ���Ƿ���ԭ�����½������Ƿ�����
            if (_list[10].ToString().Equals("0"))
            {
                this.watermarkImagesName.Enabled = false;
                this.Button11.Enabled = false;
            }
            if (_list[11].ToString().Equals("0"))
            {
                this.watermarkImages_path.Enabled = false;
                this.FileUpload1.Enabled = false;
                this.Button2.Enabled = false;
                this.Button12.Enabled = false;
            }
            //�Ƿ���������ͼ�Ƿ�����
            if (_list[12].ToString().Equals("0"))
            {
                this.smallImages.Enabled = false;
                this.Button13.Enabled = false;
            }
            //��������ͼ���Ƿ���ԭ�����½������Ƿ�����
            if (_list[13].ToString().Equals("0"))
            {
                this.smallImagesName.Enabled = false;
                this.Button14.Enabled = false;
            }
            //����ͼ���������Ƿ�����
            if (_list[14].ToString().Equals("0"))
            {
                this.smallImagesType.Enabled = false;
                this.Button15.Enabled = false;
            }
            //����ͼ����Ƿ�����
            if (_list[15].ToString().Equals("0"))
            {
                this.smallImagesW.Enabled = false;
                RangeValidator3.Enabled = false;
                this.Button16.Enabled = false;
            }
            //����ͼ�߶��Ƿ�����
            if (_list[16].ToString().Equals("0"))
            {
                this.smallImagesH.Enabled = false;
                RangeValidator4.Enabled = false;
                this.Button17.Enabled = false;
            }
            //�Ƿ�����ɾ���ļ��Ƿ�����
            if (_list[17].ToString().Equals("0"))
            {
                this.delete.Enabled = false;
                this.Button18.Enabled = false;
            }
            //�Ƿ������ļ��������Ƿ�����
            if (_list[18].ToString().Equals("0"))
            {
                this.edit.Enabled = false;
                this.Button19.Enabled = false;
            }
            //�Ƿ���ʾ�ļ��б��Ƿ�����
            if (_list[19].ToString().Equals("0"))
            {
                this.fileListBox.Enabled = false;
                this.Button20.Enabled = false;

            }
            //�ϴ��ļ����ܿ��ϴ����ļ������Ƿ�����
            if (_list[20].ToString().Equals("0"))
            {
                this.fileFilters.Enabled = false;
                this.Button21.Enabled = false;

            }
            //�ϴ�ͼƬ���ܿ��ϴ����ļ������Ƿ�����
            if (_list[21].ToString().Equals("0"))
            {
                this.imagesFilters.Enabled = false;
                this.Button22.Enabled = false;
            }
            //�ϴ��Զ������ļ����ܿ��ϴ����ļ������Ƿ�����
            if (_list[22].ToString().Equals("0"))
            {
                this.mediaFilters.Enabled = false;
                this.Button23.Enabled = false;
            }
            //�ϴ�ģ�幦�ܿ��ϴ����ļ������Ƿ�����
            if (_list[23].ToString().Equals("0"))
            {
                this.templateFilters.Enabled = false;
                this.Button24.Enabled = false;
            }


            //�ϴ��ļ��е������ÿռ�
            this.maxAllUploadSize.Text = mylist[1].ToString();
            //�ϴ��ļ����������ߴ�
            this.maxSingleUploadSize.Text = mylist[2].ToString();
            //�ϴ��ļ��Ƿ��Զ�����
            for (int i = 0; i < this.autoname.Items.Count; i++)
            {
                if (this.autoname.Items[i].Value.Equals(mylist[3].ToString()))
                {
                    this.autoname.Items[i].Selected = true;
                }
            }
            //�Ƿ������ϴ�
            for (int i = 0; i < this.allowUpload.Items.Count; i++)
            {
                if (this.allowUpload.Items[i].Value.Equals(mylist[4].ToString()))
                {
                    this.allowUpload.Items[i].Selected = true;
                }
            }
            //���ϴ���������ˮӡѡ��
            for (int i = 0; i < this.watermarkOption.Items.Count; i++)
            {
                if (this.watermarkOption.Items[i].Value.Equals(mylist[5].ToString()))
                {
                    this.watermarkOption.Items[i].Selected = true;
                }
            }
            //�����ϴ�ͼƬ������ˮӡ
            for (int i = 0; i < watermark.Items.Count; i++)
            {
                if (this.watermark.Items[i].Value.Equals(mylist[6].ToString()))
                {
                    this.watermark.Items[i].Selected = true;
                }
            }
            //��������ˮӡ���Ƿ���ԭ�����½�����
            for (int i = 0; i < this.watermarkName.Items.Count; i++)
            {
                if (this.watermarkName.Items[i].Value.Equals(mylist[7].ToString()))
                {
                    this.watermarkName.Items[i].Selected = true;
                }
            }
            //ˮӡ����
            this.watermarkText.Text = mylist[8].ToString();
            //�Ƿ������ϴ�ͼƬ��ͼƬˮӡ
            for (int i = 0; i < this.watermarkImages.Items.Count; i++)
            {
                if (this.watermarkImages.Items[i].Value.Equals(mylist[9].ToString()))
                {
                    this.watermarkImages.Items[i].Selected = true;
                }
            }
            //ͼƬˮӡ���Ƿ���ԭ�����½�����
            for (int i = 0; i < watermarkImagesName.Items.Count; i++)
            {
                if (this.watermarkImagesName.Items[i].Value.Equals(mylist[10].ToString()))
                {
                    this.watermarkImagesName.Items[i].Selected = true;
                }
            }
            //ͼƬˮӡ���ڵ�λ��
            this.watermarkImages_path.Text = mylist[11].ToString();
            //�Ƿ���������ͼ
            for (int i = 0; i < this.smallImages.Items.Count; i++)
            {
                if (this.smallImages.Items[i].Value.Equals(mylist[12].ToString()))
                {
                    this.smallImages.Items[i].Selected = true;
                }
            }
            //��������ͼ���Ƿ���ԭ�����½�����
            for (int i = 0; i < this.smallImagesName.Items.Count; i++)
            {
                if (this.smallImagesName.Items[i].Value.Equals(mylist[13].ToString()))
                {
                    this.smallImagesName.Items[i].Selected = true;
                }
            }
            //����ͼ��������,HW:ָ���߿�����(���ܱ���)��W:ָ�����߰�������H:ָ���ߣ���������Cut:ָ���߿�ü�(������)
            for (int i = 0; i < this.smallImagesType.Items.Count; i++)
            {
                if (this.smallImagesType.Items[i].Text.Equals(mylist[14].ToString()))
                {
                    this.smallImagesType.Items[i].Selected = true;
                }
            }
            //����ͼ���
            this.smallImagesW.Text = mylist[15].ToString();
            //����ͼ�߶�
            this.smallImagesH.Text = mylist[16].ToString();
            //�Ƿ�����ɾ���ļ�
            for (int i = 0; i < this.delete.Items.Count; i++)
            {
                if (this.delete.Items[i].Value.Equals(mylist[17].ToString()))
                {
                    this.delete.Items[i].Selected = true;
                }
            }
            //�Ƿ������ļ�������
            for (int i = 0; i < this.edit.Items.Count; i++)
            {
                if (this.edit.Items[i].Value.Equals(mylist[18].ToString()))
                {
                    this.edit.Items[i].Selected = true;
                }
            }
            //�Ƿ���ʾ�ļ��б�
            for (int i = 0; i < this.fileListBox.Items.Count; i++)
            {
                if (this.fileListBox.Items[i].Value.Equals(mylist[19].ToString()))
                {
                    this.fileListBox.Items[i].Selected = true;
                }
            }
            //�ϴ��ļ����ܿ��ϴ����ļ�����
            this.fileFilters.Text = mylist[20].ToString();
            //�ϴ�ͼƬ���ܿ��ϴ����ļ�����
            this.imagesFilters.Text = mylist[21].ToString();
            //�ϴ��Զ������ļ����ܿ��ϴ����ļ�����
            this.mediaFilters.Text = mylist[22].ToString();
            //�ϴ�ģ�幦�ܿ��ϴ����ļ�����
            this.templateFilters.Text = mylist[23].ToString();
        }
        /// <summary>
        /// �ϴ�ͼƬ��textbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            DirectoryInfo d = new DirectoryInfo(Path.GetFullPath(Server.MapPath(Request.Cookies["uploadFolder"].Value.ToLower())));
            FileInfo[] fis = d.GetFiles();
            Double Size = 0;
            ArrayList showfile = new ArrayList();
            string[] Filters = this.imagesFilters.Text.Split(',');
            foreach (FileInfo fi in fis)
            {
                Size += fi.Length;
                for (int i = 0; i <= Filters.Length - 1; i++)
                {
                    if (fi.Extension.ToLower() == "." + Filters[i].ToString().ToLower())
                    {
                        showfile.Add(fi);
                        break;
                    }
                }
            }

            Size = Convert.ToDouble((Double)Size / 1024);
            if (Size < Double.Parse(this.maxAllUploadSize.Text))
            {
                if (Request.Cookies["uploadFolder"] != null)
                {
                    if (this.FileUpload1.PostedFile.FileName != null && this.FileUpload1.PostedFile.FileName != "" && this.FileUpload1.PostedFile.ContentLength <= Double.Parse(this.maxSingleUploadSize.Text) * 1024)
                    {
                        this.FileUpload1.PostedFile.SaveAs(Server.MapPath(Request.Cookies["uploadFolder"].Value.ToLower() + "logo.gif"));
                        this.watermarkImages_path.Text = Request.Cookies["uploadFolder"].Value.ToLower() + "logo.gif";
                        ClientScript.RegisterStartupScript(typeof(Page), "Key", "alert('�ϴ��ɹ�!')", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(typeof(Page), "Key", "alert('�ϴ�ʧ��,�ļ��������ƴ�С���ļ���Ϊ��!')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "Key", "alert('�ϴ�ʧ��,�ռ�����!')", true);
                }
            }
        }

        /// <summary>
        /// �����ϴ��ļ��е������ÿռ�(��λKB)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            xml_update(Button3, "maxAllUploadSize", maxAllUploadSize.Text.Trim());
        }
        /// <summary>
        /// �����ϴ��ļ����������ߴ�(��λKB)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            xml_update(Button1, "maxSingleUploadSize", maxSingleUploadSize.Text.Trim());
        }
        /// <summary>
        /// �����ϴ��ļ��Ƿ��Զ�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button4_Click(object sender, EventArgs e)
        {
            xml_update(Button4, "autoname", autoname.SelectedValue);
        }
        /// <summary>
        /// �����Ƿ������ϴ�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button5_Click(object sender, EventArgs e)
        {
            xml_update(Button5, "allowUpload", allowUpload.SelectedValue);
        }
        /// <summary>
        /// ͨ�ð�������
        /// </summary>
        /// <param name="button"></param>
        /// <param name="jiedianname"></param>
        /// <param name="the_value"></param>
        private void xml_update(Button button, string jiedianname, string the_value)
        {
            boxdb = new doctextboxdb();
            string path;
            if (Request.Cookies["uploadConfig"] != null)
            {
                //��ȡ�����ļ�����
                path = Request.Cookies["uploadConfig"].Value.ToLower();

            }
            else
            {
                path = HttpContext.Current.Request.PhysicalApplicationPath + "/system_dntb/uploadconfig/default.config";
            }
            bool check = boxdb.update_xml(path, "configuration", jiedianname, the_value);
            if (check) { button.Text = "���³ɹ�"; } else { button.Text = "����ʧ��,������¸���"; }
            ClientScript.RegisterStartupScript(typeof(Page), "Key", "alert('���³ɹ�!')", true);

        }
        /// <summary>
        /// �Ƿ����ϴ���������ˮӡѡ���ѡ��onΪ������offΪ�ر�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button6_Click(object sender, EventArgs e)
        {
            xml_update(Button6, "watermarkOption", watermarkOption.SelectedValue);
            if (watermarkOption.SelectedItem.Text == "��")
            {
                watermark.Enabled = false;
                watermarkName.Enabled = false;
                watermarkText.Enabled = false;
                watermarkImages.Enabled = false;
                watermarkImagesName.Enabled = false;
                watermarkImages_path.Enabled = false;
                this.FileUpload1.Enabled = false;
                Button2.Enabled = false;
                imagesFilters.Enabled = false;
                this.Button7.Enabled = false;
                this.Button8.Enabled = false;
                this.Button9.Enabled = false;
                this.Button10.Enabled = false;
                this.Button11.Enabled = false;
                this.Button12.Enabled = false;
                this.Button22.Enabled = false;
            }
            else
            {
                watermark.Enabled = true;
                watermarkName.Enabled = true;
                watermarkText.Enabled = true;
                watermarkImages.Enabled = true;
                watermarkImagesName.Enabled = true;
                watermarkImages_path.Enabled = true;
                this.FileUpload1.Enabled = true;
                Button2.Enabled = true;
                imagesFilters.Enabled = true;
                this.Button7.Enabled = true;
                this.Button8.Enabled = true;
                this.Button9.Enabled = true;
                this.Button10.Enabled = true;
                this.Button11.Enabled = true;
                this.Button12.Enabled = true;
                this.Button22.Enabled = true;
            }
        }
        /// <summary>
        /// �Ƿ������ϴ�ͼƬ������ˮӡ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button7_Click(object sender, EventArgs e)
        {
            xml_update(Button7, "watermark", watermark.SelectedValue);
            if (watermark.SelectedItem.Text == "��")
            {
                watermarkName.Enabled = false;
                watermarkText.Enabled = false;
            }
            else
            {
                watermarkName.Enabled = true;
                watermarkText.Enabled = true;
            }
        }
        /// <summary>
        /// ��������ˮӡ���Ƿ���ԭ�����½�����,falseΪ���½�,false������ַ����½�����,���������Ը��ַ���ԭ�ļ�������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button8_Click(object sender, EventArgs e)
        {
            xml_update(Button8, "watermarkName", watermarkName.SelectedValue);
        }
        /// <summary>
        /// ����ˮӡ����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button9_Click(object sender, EventArgs e)
        {
            xml_update(Button9, "watermarkText", watermarkText.Text.Trim());
        }
        /// <summary>
        /// �Ƿ������ϴ�ͼƬ��ͼƬˮӡ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button10_Click(object sender, EventArgs e)
        {

            xml_update(Button10, "watermarkImages", watermarkImages.SelectedValue);
            if (watermarkImages.SelectedItem.Text == "��")
            {
                watermarkImagesName.Enabled = false;
                watermarkImages_path.Enabled = false;
                this.Button2.Enabled = false;
                this.FileUpload1.Enabled = false;
            }
            else
            {
                watermarkImagesName.Enabled = true;
                watermarkImages_path.Enabled = true;
                this.FileUpload1.Enabled = true;
                this.Button2.Enabled = true;
            }
        }
        /// <summary>
        /// ����ͼƬˮӡ���Ƿ���ԭ�����½�����,falseΪ���½�,false������ַ����½�����,���������Ը��ַ���ԭ�ļ�������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button11_Click(object sender, EventArgs e)
        {
            xml_update(Button11, "watermarkImagesName", watermarkImagesName.SelectedValue);
        }
        /// <summary>
        /// ����ͼƬˮӡ���ڵ�λ��
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button12_Click(object sender, EventArgs e)
        {
            xml_update(Button12, "watermarkImages_path", watermarkImages_path.Text.Trim());
        }
        /// <summary>
        /// �Ƿ���������ͼ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button13_Click(object sender, EventArgs e)
        {
            xml_update(Button13, "smallImages", smallImages.SelectedValue);
            if (smallImages.SelectedItem.Text == "��")
            {
                smallImagesName.Enabled = false;
                smallImagesType.Enabled = false;
                smallImagesW.Enabled = false;
                smallImagesH.Enabled = false;
            }
            else
            {
                smallImagesName.Enabled = true;
                smallImagesType.Enabled = true;
                smallImagesW.Enabled = true;
                smallImagesH.Enabled = true;
            }
        }
        /// <summary>
        /// ��������ͼ���Ƿ���ԭ�����½�����,falseΪ���½�,false������ַ����½�����,���������Ը��ַ���ԭ�ļ�������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button14_Click(object sender, EventArgs e)
        {
            xml_update(Button14, "smallImagesName", smallImagesName.SelectedValue);
        }
        /// <summary>
        /// ����ͼ��������,HW:ָ���߿�����(���ܱ���)��W:ָ�����߰�������H:ָ���ߣ���������Cut:ָ���߿�ü�(������)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button15_Click(object sender, EventArgs e)
        {
            xml_update(Button15, "smallImagesType", smallImagesType.SelectedItem.Text);

        }
        /// <summary>
        /// ����ͼ���
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button16_Click(object sender, EventArgs e)
        {
            xml_update(Button16, "smallImagesW", smallImagesW.Text.Trim());
        }
        /// <summary>
        /// ����ͼ�߶�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button17_Click(object sender, EventArgs e)
        {
            xml_update(Button17, "smallImagesH", smallImagesH.Text.Trim());
        }
        /// <summary>
        /// �Ƿ�����ɾ���ļ�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button18_Click(object sender, EventArgs e)
        {
            xml_update(Button18, "delete", delete.SelectedValue);
        }
        /// <summary>
        /// �Ƿ������ļ�������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button19_Click(object sender, EventArgs e)
        {
            xml_update(Button19, "edit", edit.SelectedValue);
        }
        /// <summary>
        /// �Ƿ���ʾ�ļ��б�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button20_Click(object sender, EventArgs e)
        {
            xml_update(Button20, "fileListBox", fileListBox.SelectedValue);
        }
        /// <summary>
        /// ���ļ����ܿ��ϴ����ļ�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button21_Click(object sender, EventArgs e)
        {
            xml_update(Button21, "fileFilters", fileFilters.Text.Trim());
        }
        /// <summary>
        /// �ϴ�ͼƬ���ܿ��ϴ����ļ�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button22_Click(object sender, EventArgs e)
        {
            xml_update(Button22, "imagesFilters", imagesFilters.Text.Trim());
        }
        /// <summary>
        /// �ϴ��Զ������ļ����ܿ��ϴ����ļ�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button23_Click(object sender, EventArgs e)
        {
            xml_update(Button23, "mediaFilters", mediaFilters.Text.Trim());
        }

        /// <summary>
        /// �ϴ��Զ������ļ����ܿ��ϴ����ļ�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button24_Click(object sender, EventArgs e)
        {
            xml_update(Button24, "templateFilters", templateFilters.Text.Trim());
        }
        </script>
</head>
<body leftmargin=5 topmargin=5>
    <form id="form1" runat="server">
        <table border="1" cellpadding="0" cellspacing="0" width="95%">
    <tr>
        <td style="height: 20px;" colspan="2">
            �����ϴ��ļ������Ŀ��ÿռ�(��λKB)</td>
    </tr>
    <tr >
        <td style=" height: 20px; width: 90%;">
            <asp:TextBox ID="maxAllUploadSize" runat="server" Width="329px"></asp:TextBox>
      <asp:RangeValidator ID="RangeValidator1" runat="server" BackColor="White" BorderColor="Red"
                BorderWidth="1px" ControlToValidate="maxAllUploadSize" MaximumValue="99999999999999" ErrorMessage="����������,������С0"
                MinimumValue="0" Type="Double"></asp:RangeValidator></td>
<td style="height: 20px; text-align: right;">
            <asp:Button ID="Button3" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0"  Height="24px" OnClick="Button3_Click"  /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            �����ϴ��ļ����������ߴ�(��λKB)</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="maxSingleUploadSize" runat="server" Width="328px"></asp:TextBox>
      <asp:RangeValidator ID="RangeValidator2" runat="server" BackColor="White" BorderColor="Red"
                BorderWidth="1px" ControlToValidate="maxSingleUploadSize" MaximumValue="99999999999999" ErrorMessage="����������,������С0"
                MinimumValue="0" Type="Double"></asp:RangeValidator></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button1" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button1_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �����ϴ��ļ��Ƿ��Զ�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="autoname" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button4" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button4_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �����Ƿ������ϴ�</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="allowUpload" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button5" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button5_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ����ϴ���������ˮӡѡ��</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="watermarkOption" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="off">��</asp:ListItem>
                <asp:ListItem Value="on">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button6" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button6_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ������ϴ�ͼƬ������ˮӡ</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="watermark" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button7" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button7_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ��������ˮӡ���Ƿ���ԭ�����½�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="watermarkName" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button8" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button8_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ����ˮӡ����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="watermarkText" runat="server" Width="325px"></asp:TextBox>&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="White"
                BorderColor="Red" BorderWidth="1px" ControlToValidate="watermarkText" ErrorMessage="����Ϊ��"
                Width="107px"></asp:RequiredFieldValidator></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button9" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button9_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ������ϴ�ͼƬ��ͼƬˮӡ</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="watermarkImages" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button10" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button10_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ����ͼƬˮӡ���Ƿ���ԭ�����½�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="watermarkImagesName" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button11" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button11_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            ����ͼƬˮӡ���ڵ�λ��(�Զ���Ϊlogo.gif)</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="watermarkImages_path" runat="server" Width="326px"></asp:TextBox><br />
            <asp:FileUpload ID="FileUpload1" runat="server" Width="326px" />
      <asp:Button ID="Button2" runat="server" Height="19px" OnClick="Button2_Click" Text="�ϴ�"
                Width="71px" /></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button12" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button12_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ���������ͼ</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="smallImages" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button13" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button13_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ��������ͼ���Ƿ���ԭ�����½�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="smallImagesName" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button14" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button14_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ����ͼ��������,HW:ָ���߿�����(���ܱ���)��W:ָ�����߰�������H:ָ���ߣ���������Cut:ָ���߿�ü�(������)</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="smallImagesType" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="324px">
                <asp:ListItem>HW</asp:ListItem>
                <asp:ListItem>W</asp:ListItem>
                <asp:ListItem>H</asp:ListItem>
                <asp:ListItem>CUT</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button15" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button15_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ����ͼ���</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="smallImagesW" runat="server" Width="323px"></asp:TextBox>
      <asp:RangeValidator ID="RangeValidator3" runat="server" BackColor="White" BorderColor="Red"
                BorderWidth="1px" ControlToValidate="smallImagesW" ErrorMessage="����������,����Ϊ����"
                MinimumValue="0" MaximumValue="9999" Type="Double"></asp:RangeValidator></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button16" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button16_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            ����ͼ�߶�</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="smallImagesH" runat="server" Width="322px"></asp:TextBox>
      <asp:RangeValidator ID="RangeValidator4" runat="server" BackColor="White" BorderColor="Red"
                BorderWidth="1px" ControlToValidate="smallImagesH" ErrorMessage="����������,����Ϊ����"
                MinimumValue="0" MaximumValue="9999" Type="Double"></asp:RangeValidator></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button17" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button17_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ�����ɾ���ļ�</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="delete" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button18" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button18_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ������ļ�������</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="edit" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button19" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button19_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �Ƿ���ʾ�ļ��б�</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:RadioButtonList ID="fileListBox" runat="server" BackColor="White" RepeatDirection="Horizontal"
                Width="328px">
                <asp:ListItem Value="false">��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
      </asp:RadioButtonList></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button20" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button20_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �ϴ��ļ����ܿ��ϴ����ļ�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="fileFilters" runat="server" Width="328px"></asp:TextBox></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button21" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button21_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �ϴ�ͼƬ���ܿ��ϴ����ļ�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="imagesFilters" runat="server" Width="328px"></asp:TextBox></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button22" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button22_Click" /></td>
    </tr>
    <tr >
        <td style="height: 25px" colspan="2">
            
            �ϴ��Զ������ļ����ܿ��ϴ����ļ�����</td>
    </tr>
    <tr >
        <td style=" height: 25px; width: 90%;">
            <asp:TextBox ID="mediaFilters" runat="server" Width="328px"></asp:TextBox></td>
      <td style="height: 25px; text-align: right;"><asp:Button ID="Button23" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button23_Click" /></td>
    </tr>
            <tr >
                <td colspan="2" style="height: 25px; text-align: left">
                    �ϴ�ģ�幦�ܿ��ϴ����ļ�����</td>
            </tr>
            <tr >
                <td style=" height: 25px; width: 90%;">
                    <asp:TextBox ID="templateFilters" runat="server" Width="328px"></asp:TextBox></td>
                <td style="height: 25px; text-align: right">
                    <asp:Button ID="Button24" runat="server" Text="����" Width="112px" BorderColor="#E0E0E0" Height="24px" OnClick="Button24_Click" /></td>
            </tr>
</table>

</form>
</body>
<script language=javascript>
var userAgent = navigator.userAgent.toLowerCase();
var is_ie = (userAgent.indexOf('msie') != -1);
if(is_ie)
{
document.body.bgColor="ButtonFace";
}
else
{
document.body.bgColor="#E0E0E0";
document.body.onunload=window.opener.location.reload();
}
</script>
</html>
