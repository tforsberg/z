
Partial Class FirstWebPage
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label1.Text = TextBox1.Text & ", welcome to Visual Web Developer!"
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Label1.Text = Calendar1.SelectedDate.ToString()
    End Sub
End Class
