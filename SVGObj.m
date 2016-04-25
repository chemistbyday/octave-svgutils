classdef SVGObj < handle

  properties (SetAccess = private)
    objproperties = struct ();
    parent = [];
    children = {};
    contents = struct;
  end
  
  properties (SetAccess = protected, Constant)
    canBeParent = false;
    canBeChild = false;
  end
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  methods
  
    function obj = SVGObj(varargin)
      if(nargin == 0)
      elseif(nargin == 1)
        if(isa(varargin,'SVGObj'))
          obj = copy(varargin);
        else
          error('SVGObj: invalid argument type to constructor!');
        end
      else
        error('SVGObj: invalid number of arguments to constructor!');
      end
    end
    
    function h = get(obj,varargin)
      % from http://wiki.octave.org/Object_oriented_programming
      
      publicproperties = fieldnames(obj);
      tf = ismember(tolower(publicproperties),tolower(varargin));
      if(nargin == 1)
        % no arguments in, so retrieve all public properties
        retrievethese = publicproperties;
      else
        % retrieve only specified properties
        retrievethese = {publicproperties{tf}};
      end
      
      n = numel(retrievethese);
      if(n == 1)
        h = obj.(retrievethese{1});
      else
        for i = 1:n
          h.(retrievethese{i}) = obj.(retrievethese{i});
        end
      end
      
      unknown = {varargin{!ismember(varargin,publicproperties)}};
      if(~isempty(unknown))
        cellfun (@(x) warning ("SVGObj: get: Unknown field %s\n", x) , unknown);
      end
    end
    
    %function set(obj,varargin)
    % should this function be protected?  don't want accidental resetting of parent
    %end
    
    %function obj = copy(obj)
    %end
    
    %function xml = xml(obj)
    %end
    
  end
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  methods (Access = protected)
  
    function setparent(obj, p)
      if(isa(p,SVGObj))
        if(obj.canBeChild)
          if(p.canBeParent)
            obj.parent = p;
          else
            error('SVGObj:setparent: target cannot have children!');
          end
        else
          error('SVGObj:setparent: object cannot be a child!');
        end
      else
        error('SVGObj:setparent: target is not a SVGObj!');
      end
    end
  
  end
  
end