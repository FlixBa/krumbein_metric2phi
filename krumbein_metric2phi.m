function B = krumbein_metric2phi(A, B, searchTexts)
    % A - Cell array containing text (e.g., column headers)
    % B - Numeric matrix where calculations are applied
    % searchTexts - Cell array of texts to find in A

    % Ensure A is a cell array
    if ~iscell(A)
        error('Input A must be a cell array.');
    end
    
    % Ensure B is a numeric matrix
    if ~isnumeric(B)
        error('Input B must be a numeric matrix.');
    end
    
    % Ensure searchTexts is a cell array
    if ~iscell(searchTexts)
        error('searchTexts must be a cell array of strings.');
    end

    % Find matching column indices
    columnIndices = find(ismember(A, searchTexts));

    % Check if any matches were found
    if isempty(columnIndices)
        warning('No matching texts found in A.');
        return;
    end

    % Apply the specified operation to the corresponding columns in B
    for i = 1:length(columnIndices)
        col = columnIndices(i);
        B(:, col) = -log2(B(:, col)/1000); % Apply function
    end

    % Display applied changes
    fprintf('Applied operation to columns: %s\n', num2str(columnIndices));
end