#Clear-Host
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Windows.Forms.Application]::EnableVisualStyles();

#Creating basic form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "DFDNet GUI"
$Form.Width = 400
$Form.Height = 400
$Form.FormBorderStyle = 'FixedDialog'
$Form.MaximizeBox = $false



#Add textbox for input directory
$TextBox_InputDir = New-Object System.Windows.Forms.TextBox
$TextBox_InputDir.Location = New-Object System.Drawing.Point(20,20)  ### Location of the text box
$TextBox_InputDir.Size = New-Object System.Drawing.Size(250,20)      ### Size of the text box
$TextBox_InputDir.Multiline = $true                                  ### Allows multiple lines of data
$TextBox_InputDir.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_InputDir.Enabled = $true
$TextBox_InputDir.Text = ""
$TextBox_InputDir.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_InputDir)

#Add textbox for output directory
$TextBox_OutputDir = New-Object System.Windows.Forms.TextBox
$TextBox_OutputDir.Location = New-Object System.Drawing.Point(20,50)  ### Location of the text box
$TextBox_OutputDir.Size = New-Object System.Drawing.Size(250,20)      ### Size of the text box
$TextBox_OutputDir.Multiline = $true                                  ### Allows multiple lines of data
$TextBox_OutputDir.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_OutputDir.Enabled = $true
$TextBox_OutputDir.Text = ""
$TextBox_OutputDir.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_OutputDir)


#Add textbox for GPU selection
$TextBox_GPU = New-Object System.Windows.Forms.TextBox
$TextBox_GPU.Location = New-Object System.Drawing.Point(100,75)  ### Location of the text box
$TextBox_GPU.Size = New-Object System.Drawing.Size(50,20)       ### Size of the text box
$TextBox_GPU.Multiline = $true                                  ### Allows multiple lines of data
$TextBox_GPU.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_GPU.Enabled = $false
$TextBox_GPU.Text = "0"
$TextBox_GPU.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_GPU)

#Add textbox for Scale factor
$TextBox_ScaleFactor = New-Object System.Windows.Forms.TextBox
$TextBox_ScaleFactor.Location = New-Object System.Drawing.Point(100,100)  ### Location of the text box
$TextBox_ScaleFactor.Size = New-Object System.Drawing.Size(50,20)       ### Size of the text box
$TextBox_ScaleFactor.Multiline = $true                                  ### Allows multiple lines of data
$TextBox_ScaleFactor.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_ScaleFactor.Enabled = $true
$TextBox_ScaleFactor.Text = "2"
$TextBox_ScaleFactor.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_ScaleFactor)



#Info box
$InfoBox_GPU = New-Object System.Windows.Forms.Label
$InfoBox_GPU.Text = "GPU Index"
$InfoBox_GPU.Location = New-Object System.Drawing.Size(20,78)
#$InfoBox.AutoSize = $false
$InfoBox_GPU.width = 150
#$InfoBox.TextAlign = "MiddleCenter"
$InfoBox_GPU.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_GPU)


#Info box
$InfoBox_ScaleFactor = New-Object System.Windows.Forms.Label
$InfoBox_ScaleFactor.Text = "Upscale Factor"
$InfoBox_ScaleFactor.Location = New-Object System.Drawing.Size(20,102)
#$InfoBox.AutoSize = $false
$InfoBox_ScaleFactor.width = 150
#$InfoBox.TextAlign = "MiddleCenter"
$InfoBox_ScaleFactor.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_ScaleFactor)

####################################################################################
#                                   BUTTONS                                        #
####################################################################################
#Button for Input files
$Button_InputFiles = New-Object System.Windows.Forms.Button
$Button_InputFiles.Text = "Input Files"
$Button_InputFiles.Enabled = $true
$Button_InputFiles.Location = New-Object System.Drawing.Point(300,18)
$Form.Controls.Add($Button_InputFiles)


#Button for Input files
$Button_OutputFiles = New-Object System.Windows.Forms.Button
$Button_OutputFiles.Text = "Output Files"
$Button_OutputFiles.Enabled = $true
$Button_OutputFiles.Location = New-Object System.Drawing.Point(300,48)
$Form.Controls.Add($Button_OutputFiles)

#Button for starting DFDNet
$Button_StartDFDNet = New-Object System.Windows.Forms.Button
$Button_StartDFDNet.Text = "Start DFDNet"
$Button_StartDFDNet.Enabled = $true
$Button_StartDFDNet.Location = New-Object System.Drawing.Point(100,200)
$Form.Controls.Add($Button_StartDFDNet)


#Add checkbox for CPU selection
$CheckBox_CPU = new-object System.Windows.Forms.checkbox
$CheckBox_CPU.Location = new-object System.Drawing.Size(175,75)
$CheckBox_CPU.Size = new-object System.Drawing.Size(100,20)
$CheckBox_CPU.Text = "CPU"
$CheckBox_CPU.Enabled = $true
$CheckBox_CPU.Checked = $true
$Form.Controls.Add($CheckBox_CPU)  


#File explorer
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FileBrowser.FileName



####################################################################################
#                               GLOBAL VARIABLES                                   #
####################################################################################



#Settings for DFDNet
[string]$global:SettingsFile = "$PSScriptRoot\DFDNetGUI\DFDNetSettings.txt"
[string]$global:InputImagePath
[string]$global:OutputImagePath
[string]$global:UpScaleFactor
[string]$global:GPUID



####################################################################################
#                                    EVENTS                                        #
####################################################################################

$Button_InputFiles.Add_Click({

    $null = $FileBrowser.ShowDialog()
    $global:InputImagePath = $FileBrowser.SelectedPath
    $TextBox_InputDir.Text = "$global:InputImagePath"

})


$Button_OutputFiles.Add_Click({

    $null = $FileBrowser.ShowDialog()
    $global:OutputImagePath = $FileBrowser.SelectedPath
    $TextBox_OutputDir.Text = "$global:OutputImagePath"

})


$CheckBox_CPU.Add_CheckStateCHanged({

    if($CheckBox_CPU.Checked -eq $true){
        $TextBox_GPU.Enabled = $false
    }
    else{
        $TextBox_GPU.Enabled = $true
    }

})


$Button_StartDFDNet.Add_Click({


    #Fetch user settings
    if($TextBox_InputDir.TextLength -ne 0){
        $global:InputImagePath =  $TextBox_InputDir.Text
    }
    else{
        $global:InputImagePath = "$PSScriptRoot\DFDNetGUI\InputImages"
    }
    if($TextBox_OutputDir.TextLength -ne 0){
        $global:OutputImagePath = $TextBox_OutputDir.Text
    }
    else {
        $global:OutputImagePath = "$PSScriptRoot\DFDNetGUI\OutputImages"
    }
    

    if($TextBox_ScaleFactor.TextLength -ne 0){
        $global:UpScaleFactor = $TextBox_ScaleFactor.Text
    }
    

    if($CheckBox_CPU.Checked -eq $true){
        $global:GPUID = -1 #CPU
    }
    else{ #Get info from text box
        $global:GPUID = $TextBox_GPU.Text
    }

    

    #write settings to file
    Write-Output $global:InputImagePath | Out-File $SettingsFile -Force
    Write-Output $global:OutputImagePath | Out-File $SettingsFile -Append
    Write-Output $global:UpScaleFactor | Out-File $SettingsFile -Append
    Write-Output $global:GPUID | Out-File $SettingsFile -Append


    #Start DFDNet

})


#Form load
$Form.add_Shown({
    
    If(!(test-path $SettingsFile)){ #Check if settings file is created
        
        New-Item -ItemType File -Force -Path $SettingsFile #Create file if not and write default settings.

        $global:InputImagePath =  "$PSScriptRoot\DFDNetGUI\InputImages"
        $global:OutputImagePath = "$PSScriptRoot\DFDNetGUI\OutputImages"
        $global:UpScaleFactor = 2
        $global:GPUID = -1 #CPU

        Write-Output $global:InputImagePath | Out-File $SettingsFile -Force
        Write-Output $global:OutputImagePath | Out-File $SettingsFile -Append
        Write-Output $global:UpScaleFactor | Out-File $SettingsFile -Append
        Write-Output $global:GPUID | Out-File $SettingsFile -Append

    }

    #powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Automatic logoff after 1 hour of inactivity','WARNING')}"  


})



$Form.ShowDialog()