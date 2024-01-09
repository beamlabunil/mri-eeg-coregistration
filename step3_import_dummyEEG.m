%% BEAM LAB Unil 2024

% Create a dummy eeg file used by head model computation and copy the
% channel file locations inside this newly created folder within the
% brainstorm project folder. we basically prepare the material for running
% the headmodel over multiple subjects and eventually over multiple session
% of the same subjects. 

% This is the third script that the user must execute to coregister MRI and
% EEG. Before running this script, the user must import the channel file
% using brainstorm and perform the MRI-EEG coregistration steps. See video
% tutorial available here XXX to perform these steps manually. In the case
% of a subject observed over multiple sessions, the user must perform some
% manual copy / paste steps before running this script: see also the video
% tutorial to perform this. 

% Authors:
% Kate Schipper
% Paolo Ruggeri 

%% load cfg paths
cfg_coregistration

%% load subject list to process
sbj_list = importdata('subject_list.txt');
n_sbj = length(sbj_list);

%% batch process over subjects
for nsbj = 1:n_sbj
    % Input files
    sFiles = [];
    SubjectNames = sbj_list(nsbj)';
    
    RawFiles = {...
        [root_path database_path filesep 'dummy.mat']};
    
    % Start a new report
    bst_report('Start', sFiles);
    
    % Process: Create link to raw file
    sFiles = bst_process('CallProcess', 'process_import_data_raw', sFiles, [], ...
        'subjectname',    SubjectNames{1}, ...
        'datafile',       {RawFiles{1}, 'EEG-MAT'}, ...
        'channelreplace', 0, ...
        'channelalign',   0, ...
        'evtmode',        'value');
    
    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
    
    
    % replace channel file with pohlemus
    file2copy = [root_path database_path filesep 'data/',SubjectNames{1},'/@intra/channel.mat'];
    destinationpath1 = [root_path database_path filesep 'data/',SubjectNames{1},'/@rawdummy/'];
    destinationpath2 = [root_path database_path filesep 'data/',SubjectNames{1},'/CAT12/'];
    copyfile(file2copy,destinationpath1); 
    copyfile(file2copy,destinationpath2);
    
end