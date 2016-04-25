classdef SVGDoc < SVGObj
  
  properties (Access = protected, Constant)
    canBeParent = true;
    canBeChild = false;
  end
  
  methods
  
    function obj = SVGDoc(varargin)
      warning("SVGDoc: no arguments to constructor");
    end
    
  end
  
end