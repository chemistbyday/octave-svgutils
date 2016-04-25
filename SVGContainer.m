classdef SVGContainer < SVGObj
  
  properties (Access = protected, Constant)
    canBeParent = true;
    canBeChild = true;
  end
  
  methods
  
    function obj = SVGContainer(varargin)
      warning("SVGContainer: no arguments to constructor");
    end
    
  end
  
end