%% BEAM LAB Unil 2024

% Exctraction of BEM surfaces
% This is the second script that the user must execute to coregister MRI and
% EEG. 

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
    
    % Process: Generate BEM surfaces
    sFiles = bst_process('CallProcess', 'process_generate_bem', sFiles, [], ...
        'subjectname', SubjectNames{1}, ...
        'nscalp',      1922, ...
        'nouter',      1922, ...
        'ninner',      1922, ...
        'thickness',   4, ...
        'method',      'brainstorm');  % Brainstorm
    
    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
end

