%% BEAM LAB Unil 2024

% Segmentation of individual MRI as defined in the subject_list.txt file
% This is the first script that the user must execute to coregister MRI and
% EEG. Make sure that the path are correct (see cfg.coregistration.m)

% Authors:
% Kate Schipper
% Paolo Ruggeri 

%% load subject list to process
sbj_list = importdata('subject_list.txt');
n_sbj = length(sbj_list);

%% batch process over subjects
for nsbj = 1:n_sbj
    % Input files
    sFiles = [];
    
    SubjectNames = sbj_list(nsbj);
    
    % Start a new report
    bst_report('Start', sFiles);
    
    % Process: Segment MRI with CAT12
    sFiles = bst_process('CallProcess', 'process_segment_cat12', sFiles, [], ...
        'subjectname', SubjectNames{1}, ...
        'nvertices',   15000, ...
        'tpmnii',      {'', 'Nifti1'}, ...
        'sphreg',      1, ...
        'vol',         1, ...
        'extramaps',   1, ...
        'cerebellum',  0);
    
    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
    
end
