$ErrorActionPreference = "Stop"

$notificationTitle ="["+ [DateTime]::Now.ToShortTimeString()+"]  " + $args[0] + "->" + $args[1]

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)

#Convert to .NET type for XML manipuration
$toastXml = [xml] $template.GetXml()
$toastXml.GetElementsByTagName("text").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null

#Convert back to WinRT type
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($toastXml.OuterXml)

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$toast.Tag = "Emacs"
$toast.Group = "Emacs"
$toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes(60)
#$toast.SuppressPopup = $true

$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Emacs")
$notifier.Show($toast);