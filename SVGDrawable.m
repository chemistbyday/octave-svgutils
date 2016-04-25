classdef SVGDrawable < SVGObj
  
  properties (Access = protected, Constant)
    canBeParent = false;
    canBeChild = true;
  end
  
  methods
  
    function obj = SVGDrawable(varargin)
      warning("SVGDrawable: no arguments to constructor");
    end
    
  end
  
end