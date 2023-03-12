classdef SomeViewModel < micromvvm.AbstractViewModel
    
    properties (SetObservable)
        Greetings (1,1) string = "Hello World"
    end
        
    % Greetings command and setter implementation
    methods (Access = public)        
        function command = greet(obj)
            command = micromvvm.RelayCommand(@obj.greetExecute);
        end
    end
    
    methods (Access = private)
        function greetExecute(obj)
            disp(obj.Greetings)
        end
    end
    
end