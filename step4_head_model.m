%% BEAM LAB Unil 2024

% Step 4: compute the head model. Refresh brainstorm before running this
% script

% Authors:
% Kate Schipper
% Paolo Ruggeri 


%% load subject list to process
sbj_list = importdata('subject_list.txt');
n_sbj = length(sbj_list);

%% batch process over subjects
for nsbj = 1:n_sbj
    
    sFiles = {...
        [sbj_list{nsbj},'/@rawdummy/data_0raw_dummy.mat']};
    
    % Start a new report
    bst_report('Start', sFiles);
    
    % Process: Compute head model
    sFiles = bst_process('CallProcess', 'process_headmodel', sFiles, [], ...
        'Comment',     '', ...
        'sourcespace', 1, ...  % Cortex surface
        'meg',         3, ...  % Overlapping spheres
        'eeg',         3, ...  % OpenMEEG BEM
        'ecog',        2, ...  % OpenMEEG BEM
        'seeg',        2, ...  % OpenMEEG BEM
        'openmeeg',    struct(...
        'BemFiles',     {{}}, ...
        'BemNames',     {{'Scalp', 'Skull', 'Brain'}}, ...
        'BemCond',      [1, 0.0125, 1], ...
        'BemSelect',    [1, 1, 1], ...
        'isAdjoint',    0, ...
        'isAdaptative', 1, ...
        'isSplit',      0, ...
        'SplitLength',  4000), ...
        'channelfile', '');
    
    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
end

