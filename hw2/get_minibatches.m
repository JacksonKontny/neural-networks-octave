function [x_batches, y_batches] = get_minibatches(inputs, targets, batchSize)    x_batches = {};    y_batches = {};    num_inputs = length(inputs);    # Create a random index for selecting inputs and targets    [_, new_idx]  = sort(rand(num_inputs, 1));        # Use this new random index to select inputs and targets - they will be paired    inputs_randomized = inputs(:, new_idx);    targets_randomized = targets(:, new_idx);    num_batches = ceil(num_inputs / batchSize);        # Now loop through the number of batches and segment the randomized inputs into each batch    for batch = 0:num_batches - 2        batch_start_idx = batch * batchSize;        x_batch = inputs_randomized(:, batch_start_idx +1:batch_start_idx + batchSize);        x_batches{batch + 1} = x_batch;                y_batch = targets_randomized(:, batch_start_idx +1:batch_start_idx + batchSize);        y_batches{batch + 1} = y_batch;    endfor        # Since the last batch might not fit perfectly into the input size, add anything left over    if (num_batches * batchSize > num_inputs)        x_batch = inputs_randomized(:, batchSize * (num_batches - 1) + 1: end);        x_batches{num_batches} = x_batch;                y_batch = targets_randomized(:, batchSize * (num_batches - 1) + 1: end);        y_batches{num_batches} = y_batch;    endifendfunction