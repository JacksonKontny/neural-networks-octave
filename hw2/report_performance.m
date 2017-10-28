function validation_error = report_performance(epoch, datasets, weights, biases, cost_function)    dataset_descriptions = {'train', 'val', 'test'};    printf('%3i|', epoch);    for dataset_idx = 1: length(datasets)        data = datasets{dataset_idx};        [error, correct] = evaluate(data{1}, weights, biases, data{2}, cost_function);        num_targets = length(data{2});        percent = correct / num_targets;        description = dataset_descriptions{dataset_idx};        printf(' %1.3f |%3i/%3i| %.3f ||', error, correct, num_targets, percent);        if strcmp(description, 'val')            validation_error = error;        endif    endfor    printf('\n');    endfunction