function d = cost_derivative(activations, y_batch, cost_function)    # Cost derivative is just a - y    if (cost_function == 'quadratic')        d = activations{end} - y_batch;    elseif (cost_function == 'cross-entropy')        d = 'something else'    elseif (cost_function == 'log-liklihood')        d = 'll'    endifendfunction