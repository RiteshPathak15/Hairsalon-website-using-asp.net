using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class ManageOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrders();
        }
    }

    private void LoadOrders()
    {
        // Simulating data for demonstration purposes
        DataTable dt = new DataTable();
        dt.Columns.Add("OrderId", typeof(int));
        dt.Columns.Add("ProductName", typeof(string));
        dt.Columns.Add("Quantity", typeof(int));
        dt.Columns.Add("Price", typeof(decimal));
        dt.Columns.Add("Status", typeof(string));

        // Add some dummy data
        dt.Rows.Add(1, "Shampoo", 2, 15.00, "Pending");
        dt.Rows.Add(2, "Conditioner", 1, 10.00, "Shipped");
        dt.Rows.Add(3, "Hair Oil", 3, 20.00, "Pending");

        OrdersRepeater.DataSource = dt;
        OrdersRepeater.DataBind();
    }

    protected void CancelOrder_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int orderId = Convert.ToInt32(btn.CommandArgument);

        // Here, you would implement logic to cancel the order in your database
        // For example, update the order status in your database

        // After canceling, reload the orders
        LoadOrders();
    }
}
