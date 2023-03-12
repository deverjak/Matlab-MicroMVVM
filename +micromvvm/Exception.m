classdef Exception
        
    methods (Static)
        
        function me = invalidArgumentType(should, is)
            me = MException('micromvvm:InvalidArgument', ...
                strcat("Passed argument is not of a valid type, expected ", ...
                should, ", but got ", is));
        end
    end
end

