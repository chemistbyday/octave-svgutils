classdef SVGObj < handle

  properties (Access = private)
    objproperties = struct ();
    parent = [];
    children = {};
    contents = struct;
  end
  
  properties (Access = protected, Constant)
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
        elseif(isa(varargin,'string'))
          obj = SVGObjOfType(varargin);
        end
      else
        error('SVGObj: invalid number of arguments to constructor!');
      end
    end
    
    %function h = get(obj,varargin)
    %end
    
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
            error('SVGObj:setparent: input cannot have children!');
          end
        else
          error('SVGObj:setparent: object cannot be a child!');
        end
      else
        error('SVGObj:setparent: input is not a SVGObj!');
      end
    end
  
  end
  
end