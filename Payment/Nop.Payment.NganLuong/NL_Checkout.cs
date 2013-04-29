using System;
using System.Data;
using System.Configuration;
using System.Web;

using System.Collections;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Orders;
using NopSolutions.NopCommerce.BusinessLogic.Payment;
using NopSolutions.NopCommerce.Common;

namespace NopSolutions.NopCommerce.Payment.Methods.NganLuong
{
    public class NL_Checkout : IPaymentMethod
    {
        //private String nganluong_url = "https://www.nganluong.vn/checkout.php";

        //private String merchant_site_code = "17130";	//thay mã merchant site mà b?n dã dang ký vào dây

        //private String secure_pass = "hoangkhanh8386";	//thay mật khẩu giao tiếp giữa website c?a b?n v?i NgânLu?ng.vn mà bạn đã ký vào dây

        public String GetMD5Hash(String input)
        {

            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();

            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);

            bs = x.ComputeHash(bs);

            System.Text.StringBuilder s = new System.Text.StringBuilder();

            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            String md5String = s.ToString();
            return md5String;
        }

        public String buildCheckoutUrl(String return_url, String receiver, String transaction_info, String order_code, String price, String merchant_site_code, String secure_pass, String nganluong_url)
        {
            // T?o bi?n secure code
            String secure_code = "";

            secure_code += merchant_site_code;

            secure_code += " " + HttpUtility.UrlEncode(return_url).ToLower();

            secure_code += " " + receiver;

            secure_code += " " + transaction_info;

            secure_code += " " + order_code;

            secure_code += " " + price;

            secure_code += " " + secure_pass;

            // T?o m?ng bam
            Hashtable ht = new Hashtable();

            ht.Add("merchant_site_code", merchant_site_code);

            ht.Add("return_url", HttpUtility.UrlEncode(return_url).ToLower());

            ht.Add("receiver", receiver);

            ht.Add("transaction_info", transaction_info);

            ht.Add("order_code", order_code);

            ht.Add("price", price);

            ht.Add("secure_code", this.GetMD5Hash(secure_code));

            // T?o url redirect
            String redirect_url = nganluong_url;

            if (redirect_url.IndexOf("?") == -1)
            {
                redirect_url += "?";
            }
            else if (redirect_url.Substring(redirect_url.Length - 1, 1) != "?" && redirect_url.IndexOf("&") == -1)
            {
                redirect_url += "&";
            }

            String url = "";

            // Duy?t các ph?n t? trong m?ng bam ht1 d? t?o redirect url
            IDictionaryEnumerator en = ht.GetEnumerator();

            while (en.MoveNext())
            {
                if (url == "")
                    url += en.Key.ToString() + "=" + en.Value.ToString();
                else
                    url += "&" + en.Key.ToString() + "=" + en.Value.ToString();
            }

            String rdu = redirect_url + url;

            return rdu;
        }

        public Boolean verifyPaymentUrl(String transaction_info, String order_code, String price, String payment_id, String payment_type, String error_text, String secure_code, String merchant_site_code, String secure_pass)
        {
            // T?o mã xác th?c t? ch? web
            String str = "";

            str += " " + transaction_info;

            str += " " + order_code;

            str += " " + price;

            str += " " + payment_id;

            str += " " + payment_type;

            str += " " + error_text;

            str += " " + merchant_site_code;

            str += " " + secure_pass;

            // Mã hóa các tham s?
            String verify_secure_code = "";

            verify_secure_code = this.GetMD5Hash(str);

            // Xác th?c mã c?a ch? web v?i mã tr? v? t? nganluong.vn
            if (verify_secure_code == secure_code) return true;

            return false;
        }

        #region Methods

        /// <summary>
        /// Process payment
        /// </summary>
        /// <param name="paymentInfo">Payment info required for an order processing</param>
        /// <param name="customer">Customer</param>
        /// <param name="OrderGuid">Unique order identifier</param>
        /// <param name="processPaymentResult">Process payment result</param>
        public void ProcessPayment(PaymentInfo paymentInfo, Customer customer, Guid OrderGuid, ref ProcessPaymentResult processPaymentResult)
        {
            processPaymentResult.PaymentStatus = PaymentStatusEnum.Pending;
        }

        /// <summary>
        /// Post process payment (payment gateways that require redirecting)
        /// </summary>
        /// <param name="order">Order</param>
        /// <returns>The error status, or String.Empty if no errors</returns>
        public string PostProcessPayment(Order order)
        {
            return string.Empty;
        }

        /// <summary>
        /// Gets additional handling fee
        /// </summary>
        /// <returns>Additional handling fee</returns>
        public decimal GetAdditionalHandlingFee()
        {
            //override if payment method requires additional handling fee
            return decimal.Zero;
        }

        /// <summary>
        /// Captures payment (from admin panel)
        /// </summary>
        /// <param name="order">Order</param>
        /// <param name="processPaymentResult">Process payment result</param>
        public void Capture(Order order, ref ProcessPaymentResult processPaymentResult)
        {
            throw new NopException("Capture method not supported");
        }

        /// <summary>
        /// Gets a value indicating whether capture is allowed from admin panel
        /// </summary>
        public bool CanCapture
        {
            get
            {
                return false;
            }
        }
        #endregion
    }
}
