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


#Add textbox for conda enviroment name
$TextBox_CondaName = New-Object System.Windows.Forms.TextBox
$TextBox_CondaName.Location = New-Object System.Drawing.Point(100,75)  ### Location of the text box
$TextBox_CondaName.Size = New-Object System.Drawing.Size(50,20)       ### Size of the text box
$TextBox_CondaName.Multiline = $false                                  ### Allows multiple lines of data
$TextBox_CondaName.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_CondaName.Enabled = $true
$TextBox_CondaName.Text = ""
$TextBox_CondaName.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_CondaName)


#Add textbox for GPU selection
$TextBox_GPU = New-Object System.Windows.Forms.TextBox
$TextBox_GPU.Location = New-Object System.Drawing.Point(100,100)  ### Location of the text box
$TextBox_GPU.Size = New-Object System.Drawing.Size(50,20)       ### Size of the text box
$TextBox_GPU.Multiline = $true                                  ### Allows multiple lines of data
$TextBox_GPU.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_GPU.Enabled = $false
$TextBox_GPU.Text = "0"
$TextBox_GPU.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_GPU)

#Add textbox for Scale factor
$TextBox_ScaleFactor = New-Object System.Windows.Forms.TextBox
$TextBox_ScaleFactor.Location = New-Object System.Drawing.Point(100,125)  ### Location of the text box
$TextBox_ScaleFactor.Size = New-Object System.Drawing.Size(50,20)       ### Size of the text box
$TextBox_ScaleFactor.Multiline = $false                                  ### Allows multiple lines of data
$TextBox_ScaleFactor.AcceptsReturn = $true                              ### By hitting enter it creates a new line
$TextBox_ScaleFactor.Enabled = $true
$TextBox_ScaleFactor.Text = "2"
$TextBox_ScaleFactor.ScrollBars = "None"                                ### Allows for a vertical scroll bar if the list of text is too big for the window
$Form.Controls.Add($TextBox_ScaleFactor)


#Info box
$InfoBox_CondaName = New-Object System.Windows.Forms.Label
$InfoBox_CondaName.Text = "Conda Name"
$InfoBox_CondaName.Location = New-Object System.Drawing.Size(20,78)
#$InfoBox.AutoSize = $false
$InfoBox_CondaName.width = 150
#$InfoBox.TextAlign = "MiddleCenter"
$InfoBox_CondaName.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_CondaName)


#Info box
$InfoBox_GPU = New-Object System.Windows.Forms.Label
$InfoBox_GPU.Text = "GPU Index"
$InfoBox_GPU.Location = New-Object System.Drawing.Size(20,102)
#$InfoBox.AutoSize = $false
$InfoBox_GPU.width = 150
#$InfoBox.TextAlign = "MiddleCenter"
$InfoBox_GPU.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_GPU)


#Info box
$InfoBox_ScaleFactor = New-Object System.Windows.Forms.Label
$InfoBox_ScaleFactor.Text = "Upscale Factor"
$InfoBox_ScaleFactor.Location = New-Object System.Drawing.Size(20,126)
#$InfoBox.AutoSize = $false
$InfoBox_ScaleFactor.width = 150
#$InfoBox.TextAlign = "MiddleCenter"
$InfoBox_ScaleFactor.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_ScaleFactor)


#Info box -Progressbar 0
$InfoBox_Progressbar0 = New-Object System.Windows.Forms.Label
$InfoBox_Progressbar0.Text = "Input"
$InfoBox_Progressbar0.Location = New-Object System.Drawing.Size(10,228)
#$InfoBox_Progressbar0.width = 50
$InfoBox_Progressbar0.AutoSize = $true
$InfoBox_Progressbar0.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_Progressbar0)


#Info box -Progressbar 1
$InfoBox_Progressbar1 = New-Object System.Windows.Forms.Label
$InfoBox_Progressbar1.Text = "Affine Param"
$InfoBox_Progressbar1.Location = New-Object System.Drawing.Size(10,253)
#$InfoBox_Progressbar1.width = 70
$InfoBox_Progressbar1.AutoSize = $true
$InfoBox_Progressbar1.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_Progressbar1)

#Info box -Progressbar 2
$InfoBox_Progressbar2 = New-Object System.Windows.Forms.Label
$InfoBox_Progressbar2.Text = "Landmarks"
$InfoBox_Progressbar2.Location = New-Object System.Drawing.Size(10,278)
#$InfoBox_Progressbar2.width = 50
$InfoBox_Progressbar2.AutoSize = $true
$InfoBox_Progressbar2.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_Progressbar2)

#Info box -Progressbar 3
$InfoBox_Progressbar3 = New-Object System.Windows.Forms.Label
$InfoBox_Progressbar3.Text = "Restore Face"
$InfoBox_Progressbar3.Location = New-Object System.Drawing.Size(10,303)
#$InfoBox_Progressbar3.width = 50
$InfoBox_Progressbar3.AutoSize = $true
$InfoBox_Progressbar3.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_Progressbar3)

#Info box -Progressbar 3
$InfoBox_Progressbar4 = New-Object System.Windows.Forms.Label
$InfoBox_Progressbar4.Text = "Final"
$InfoBox_Progressbar4.Location = New-Object System.Drawing.Size(10,328)
#$InfoBox_Progressbar4.width = 50
$InfoBox_Progressbar4.AutoSize = $true
$InfoBox_Progressbar4.BackColor = "Transparent"
$Form.Controls.Add($InfoBox_Progressbar4)


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
$Button_StartDFDNet.Location = New-Object System.Drawing.Point(20,165)
$Button_StartDFDNet.Size = new-object System.Drawing.Size(350,50)
$Form.Controls.Add($Button_StartDFDNet)


#Add checkbox for CPU selection
$CheckBox_CPU = new-object System.Windows.Forms.checkbox
$CheckBox_CPU.Location = new-object System.Drawing.Size(175,100)
$CheckBox_CPU.Size = new-object System.Drawing.Size(100,20)
$CheckBox_CPU.Text = "CPU"
$CheckBox_CPU.Enabled = $true
$CheckBox_CPU.Checked = $true
$Form.Controls.Add($CheckBox_CPU)  

####################################################################################
#                                   MISC                                           #
####################################################################################


#File explorer
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FileBrowser.FileName

#Timer for checking DFDNet status
$Timer = New-Object system.windows.forms.timer
$Timer.Interval = 500 #500ms
$Timer.Enabled = $false

#Progress bar for DFDNet step 0
$ProgressBar_Step0 = New-Object System.Windows.Forms.ProgressBar
$ProgressBar_Step0.Location = New-Object System.Drawing.Point(85, 225)
$ProgressBar_Step0.Size = New-Object System.Drawing.Size(285, 20)
$ProgressBar_Step0.Minimum = 0
$Form.Controls.Add($ProgressBar_Step0);

#Progress bar for DFDNet step 1
$ProgressBar_Step1 = New-Object System.Windows.Forms.ProgressBar
$ProgressBar_Step1.Location = New-Object System.Drawing.Point(85, 250)
$ProgressBar_Step1.Size = New-Object System.Drawing.Size(285, 20)
$ProgressBar_Step1.Minimum = 0
$Form.Controls.Add($ProgressBar_Step1);

#Progress bar for DFDNet step 2
$ProgressBar_Step2 = New-Object System.Windows.Forms.ProgressBar
$ProgressBar_Step2.Location = New-Object System.Drawing.Point(85, 275)
$ProgressBar_Step2.Size = New-Object System.Drawing.Size(285, 20)
$ProgressBar_Step2.Minimum = 0
$Form.Controls.Add($ProgressBar_Step2);

#Progress bar for DFDNet step 3
$ProgressBar_Step3 = New-Object System.Windows.Forms.ProgressBar
$ProgressBar_Step3.Location = New-Object System.Drawing.Point(85, 300)
$ProgressBar_Step3.Size = New-Object System.Drawing.Size(285, 20)
$ProgressBar_Step3.Minimum = 0
$Form.Controls.Add($ProgressBar_Step3);

#Progress bar for DFDNet step 4
$ProgressBar_Step4 = New-Object System.Windows.Forms.ProgressBar
$ProgressBar_Step4.Location = New-Object System.Drawing.Point(85, 325)
$ProgressBar_Step4.Size = New-Object System.Drawing.Size(285, 20)
$ProgressBar_Step4.Minimum = 0
$Form.Controls.Add($ProgressBar_Step4);


####################################################################################
#                               GLOBAL VARIABLES                                   #
####################################################################################


#Settings for DFDNet
[string]$global:SettingsFile = "$PSScriptRoot\DFDNetGUI\DFDNetSettings.txt"
[string]$global:InputImagePath
[string]$global:OutputImagePath
[string]$global:CondaEnviromentName
[string]$global:UpScaleFactor
[string]$global:GPUID

#DFDNet process
$global:DFDNetProcess

#For progressbar. Im sure there is a better way of doing this. I just dont know how.
#Shoudl be able to pipe the created process output directly to this process.
[int]$global:InputFileCount


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
    
    if($TextBox_CondaName.TextLength -ne 0){
        $global:CondaEnviromentName = $TextBox_CondaName.Text
    }
    else{
        $global:CondaEnviromentName = "base"
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
    Write-Output $global:CondaEnviromentName | Out-File $SettingsFile -Append
    Write-Output $global:UpScaleFactor | Out-File $SettingsFile -Append
    Write-Output $global:GPUID | Out-File $SettingsFile -Append


    #Start DFDNet
    #Get Anaconda path, no idea how to do this in a clean way...
    $AnacondaPath = (Get-Command anaconda).Path 
    $AnacondaPath = Split-Path $AnacondaPath -Parent
    $AnacondaPath = Split-Path $AnacondaPath -Parent

    $TemporaryOutput = "$PSScriptRoot\DFDNetGUI\_TMPOutput"

    $DFDNetOption = "python test_FaceDict.py --test_path $global:InputImagePath --results_dir $TemporaryOutput --upscale_factor $global:UpScaleFactor --gpu_ids $global:GPUID"

    #Start-Process PowerShell -ArgumentList "-ExecutionPolicy ByPass -NoExit -Command ""& '$AnacondaPath\shell\condabin\conda-hook.ps1' ; conda activate $global:CondaEnviromentName; $DFDNetOption"""
    $global:DFDNetProcess = Start-Process PowerShell -ArgumentList "-ExecutionPolicy ByPass -Command ""& '$AnacondaPath\shell\condabin\conda-hook.ps1' ; conda activate $global:CondaEnviromentName; $DFDNetOption""" -WindowStyle Minimized -PassThru

    #Configure the progress bars
    $global:InputFileCount = (Get-ChildItem -File $global:InputImagePath).Count
    #Write-Host $global:InputFileCount

    $ProgressBar_Step0.Maximum = $global:InputFileCount
    $ProgressBar_Step1.Maximum = $global:InputFileCount
    $ProgressBar_Step2.Maximum = $global:InputFileCount
    $ProgressBar_Step3.Maximum = $global:InputFileCount
    $ProgressBar_Step4.Maximum = $global:InputFileCount

    $Timer.Start()


})


#Form load. Handles the saved settings
$Form.add_Shown({
    
    If(!(test-path $SettingsFile)){ #Check if settings file is created
        
        New-Item -ItemType File -Force -Path $SettingsFile #Create file if not and write default settings.

        $global:InputImagePath =  "$PSScriptRoot\DFDNetGUI\InputImages"
        $global:OutputImagePath = "$PSScriptRoot\DFDNetGUI\OutputImages"
        $global:CondaEnviromentName = "base"
        $global:UpScaleFactor = 2
        $global:GPUID = -1 #CPU

        Write-Output $global:InputImagePath | Out-File $SettingsFile -Force
        Write-Output $global:OutputImagePath | Out-File $SettingsFile -Append
        Write-Output $global:CondaEnviromentName | Out-File $SettingsFile -Append
        Write-Output $global:UpScaleFactor | Out-File $SettingsFile -Append
        Write-Output $global:GPUID | Out-File $SettingsFile -Append

    }
    else{ #Load all settings from file
        $global:InputImagePath =  Get-Content $global:SettingsFile | Select-Object -Index 0
        $global:OutputImagePath =  Get-Content $global:SettingsFile | Select-Object -Index 1
        $global:CondaEnviromentName = Get-Content $global:SettingsFile | Select-Object -Index 2
        $global:UpScaleFactor = Get-Content $global:SettingsFile | Select-Object -Index 3
        $global:GPUID = Get-Content $global:SettingsFile | Select-Object -Index 4

    }

    #Fill settings boxes
    $TextBox_InputDir.Text = $global:InputImagePath
    $TextBox_OutputDir.Text = $global:OutputImagePath
    $TextBox_ScaleFactor.Text = $global:UpScaleFactor
    $TextBox_CondaName.Text = $global:CondaEnviromentName

    if($global:GPUID -eq -1){
        $CheckBox_CPU.Checked = $true
    }
    else{
        $CheckBox_CPU.Checked = $false
        $TextBox_ScaleFactor.Text = $global:GPUID
    }


    #Create folders
    if(!(Test-Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step0_Input")){
        New-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step0_Input" -ItemType Directory
    }
    if(!(Test-Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step1_CropImg")){
        New-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step1_CropImg" -ItemType Directory
    }
    if(!(Test-Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step2_Landmarks")){
        New-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step2_Landmarks" -ItemType Directory
    }
    if(!(Test-Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step3_RestoreCropFace")){
        New-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step3_RestoreCropFace" -ItemType Directory
    }
    if(!(Test-Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step4_FinalResults")){
        New-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step4_FinalResults" -ItemType Directory
    }
    
})

$Timer.add_Tick({


    try{
        if($ProgressBar_Step0.Value -le $ProgressBar_Step0.Maximum){
            $ProgressBar_Step0.Value = (Get-ChildItem -File "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step0_Input").Count
        }
        if($ProgressBar_Step1.Value -le $ProgressBar_Step1.Maximum){
            $ProgressBar_Step1.Value = (Get-ChildItem -File "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step1_CropImg").Count
        }
        if($ProgressBar_Step2.Value -le $ProgressBar_Step2.Maximum){
            $ProgressBar_Step2.Value = (Get-ChildItem -File "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step2_Landmarks").Count
        }
        if($ProgressBar_Step3.Value -le $ProgressBar_Step3.Maximum){
            $ProgressBar_Step3.Value = (Get-ChildItem -File "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step3_RestoreCropFace").Count
        }
        if($ProgressBar_Step4.Value -le $ProgressBar_Step4.Maximum){
            $ProgressBar_Step4.Value = (Get-ChildItem -File "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step4_FinalResults").Count
        }

    }
    catch{
        $ProgressBar_Step0.Value = 0
        $ProgressBar_Step1.Value = 0
        $ProgressBar_Step2.Value = 0
        $ProgressBar_Step3.Value = 0
        $ProgressBar_Step4.Value = 0
    }

    if($global:DFDNetProcess.HasExited){ #Then we are done
        Copy-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput\Step4_FinalResults\*" -Destination $OutputImagePath -Recurse
        Start-Sleep -Milliseconds 100
        Remove-Item -Path "$PSScriptRoot\DFDNetGUI\_TMPOutput" -Recurse -Force
        $Timer.Stop()
    }

    
    Start-Sleep -Milliseconds 10 #It get angry and glicthes if run without a delay :(
})


$Form.ShowDialog()