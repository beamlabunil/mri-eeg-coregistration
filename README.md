# mri-eeg-coregistration

# SEMI-AUTOMATIC MRI-EEG COREGISTRATION PIPELINE

## DESCRIPTION 
This README outlines a semi-automatic pipeline customized in MATLAB utilizing scripts from Brainstorm. The purpose of this pipeline is to automate the coregistration process for individual MRI scans and EEG electrode positioning. The pipeline involves a combination of manual steps facilitated by a graphical user interface (GUI) and automated processes through MATLAB scripts.
Features 
-	Manual steps : Instructions are provided for the manual tasks within Brainstorm (see tutorial video below)
-	Automatic steps : MATLAB scripts from Brainstorm are employed to automate specific tasks such as MRI segmentation using Cat12, generation of Boundary Element Model (BEM) surfaces, importation of a "dummy" EEG signal and computation of a head model. 

## SUPPORT 
See tutorial video here xxx (to come)
Refer to software documentation for additional details or updates here : Brainstorm tutotial website

## BUILT WITH
-	Matlab
-	Brainstorm scripts

## GETTING STARTED
Prerequisites 
-	Matlab
-	Brainstorm : cat12 and spm12 plugins must be loaded 

## Instructions
1.	Create Brainstorm Protocol:
-	Set up a new folder and protocol in Brainstorm and name it “mri-EEG-coregistration” (if you want to follow our labelling system)
2.	MRI Import and Normalization:
-	Import T1 MRI and compute MNI normalization and verify the marking of the NAS/LPA/RPA fiducials.
3.	MRI segmentation and  BEM surface generation:
-	Execute MATLAB scripts (step1 and step2) 
4.	OPTIONAL - For longitudinal study (more than one session per subject):
-	Copy the created folders (Anat and Data folders) and paste them making sure to rename them with “Session2” for example and reload the protocol.
5.	EEG Sensor Location Import:
-	Import the EEG channel file (format must be compatible with Braistorm)
6.	Coregister EEG and MRI:
-	Coregister EEG and MRI data, refine coregistration using head points and check registration process. Enhance accuracy by projecting electrodes onto the surface of the scalp.
7.	Import Dummy EEG signal
-	Run script step3 and reload protocol.
8.	Build Head model
-	Before running step4 script ensure correct BEM surface files are selected in the "anat" folder


## CONTACT
Kate Schipper : kate.schipper@unil.ch
Paolo Ruggeri : paolo.ruggeri@unil.ch

## ACKNOWLEDGMENTS
