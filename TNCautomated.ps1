Add-Type -AssemblyName System.Windows.Forms

# Create form
$form = New-Object Windows.Forms.Form
$form.Text = "Test-NetConnection GUI"
$form.Width = 300
$form.Height = 150
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

# Create IP label and textbox
$lblIP = New-Object Windows.Forms.Label
$lblIP.Text = "IP Address:"
$lblIP.Top = 20
$lblIP.Left = 20
$form.Controls.Add($lblIP)

$txtIP = New-Object Windows.Forms.TextBox
$txtIP.Top = 20
$txtIP.Left = 120
$form.Controls.Add($txtIP)

# Create port label and textbox
$lblPort = New-Object Windows.Forms.Label
$lblPort.Text = "Port:"
$lblPort.Top = 50
$lblPort.Left = 20
$form.Controls.Add($lblPort)

$txtPort = New-Object Windows.Forms.TextBox
$txtPort.Top = 50
$txtPort.Left = 120
$form.Controls.Add($txtPort)

# Create OK button
$btnOK = New-Object Windows.Forms.Button
$btnOK.Text = "OK"
$btnOK.Top = 80
$btnOK.Left = 120
$btnOK.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.Controls.Add($btnOK)

# Event handler for the OK button click
$form.Add_OkButtonClicked({
    $ip = $txtIP.Text
    $port = $txtPort.Text

    $result = Test-NetConnection -ComputerName $ip -Port $port

    # Display the result in a message box
    [System.Windows.Forms.MessageBox]::Show($result)
})
    $ip = $txtIP.Text
    $port = $txtPort.Text

    $result = Test-NetConnection -ComputerName $ip -Port $port

    # Display the result in a message box
    [System.Windows.Forms.MessageBox]::Show($result)

# Show the form
$result = $form.ShowDialog()

# Dispose of the form
$form.Dispose()
