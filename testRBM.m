function [ ] = testRBM( nHidRange, lRateRange, batchSzRange, nEpochRange )
%TESTRBM calculates classification error for hidden nodes,
% learning rates, batch sizes and epochs in their given ranges.

% nHidRange = 100:100;
% lRateRange = 0.1:0.1;
% batchSzRange = 100:100;
% nEpochRange = 100:100;

% number of hidden units ? {100, 1000}
% learning rate ? {0.01, 0.1}
% batch size ? {100, 500}
% number of epochs ? {100, 250}

fileID = fopen('output.txt', 'w');
fprintf(fileID, 'testRBM SAMPLING\n\n');
smallestError = inf;

for nEpoch = nEpochRange

    for batchSz = batchSzRange

        for lRate = lRateRange
           
            for nHid = nHidRange
 
                error = RBM(nHid, lRate, batchSz, nEpoch);
                
                fprintf(fileID, '#######################\n');
                fprintf(fileID, 'ERROR = %5f\n\n', error);
                fprintf(fileID, 'nHid  = %i\n',   nHid);
                fprintf(fileID, 'lRate = %2f\n',   lRate);
                fprintf(fileID, 'batchSz = %i\n',   batchSz);
                fprintf(fileID, 'nEpoch = %i\n', nEpoch);
                fprintf(fileID, '#######################\n\n');
                
                % Store the best configuration seen so far
                if error < smallestError
                   smallestError = error;
                   optimal_nHid = nHid;
                   optimal_lRate = lRate;
                   optimal_batchSz = batchSz;
                   optimal_nEpoch = nEpoch;
                end
                
            end
            
        end
        
    end
    
end

% Output best configuration
fprintf(fileID, '\n\n#######################\n');
fprintf(fileID, 'BEST ERROR = %5f\n\n', smallestError);
fprintf(fileID, 'nHid  = %i\n',         optimal_nHid);
fprintf(fileID, 'lRate = %2f\n',        optimal_lRate);
fprintf(fileID, 'batchSz = %i\n',       optimal_batchSz);
fprintf(fileID, 'nEpoch = %i\n',        optimal_nEpoch);
fprintf(fileID, '#######################\n\n');

fclose(fileID);

end