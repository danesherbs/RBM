function [classErr] = RBM(nHid, lRate, batchSz, nEpoch)

% Load data set
load('caltech101_silhouettes_28_split1.mat');

% Calculate number of visual nodes, nVis
[nObs,nVis] = size(train_data);

% Set RBM parameters
arch = struct('size', [nVis,nHid], 'classifier', true, 'inputType', 'binary');
arch.opts = {   'verbose', 1, ...
                'lRate', lRate, ...
                'nEpoch', nEpoch, ...
                'batchSz', batchSz, ...
                'nGibbs', 1};

% Initialise and train RBM            
r = rbm(arch).train(train_data,single(train_labels));

% Compute error given test_data and test_labels
[~,classErr,misClass] = r.classify(test_data, single(test_labels));

end