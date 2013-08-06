function b = subsref(p,s)
% SUBSREF 
switch s.type
case '.'
    switch s.subs
        case 'config'
            b = p.config;
        case 'color'
            b = p.color;
        case 'patchpoints'
            b = p.patchpoints;
        case 'nverts'
            b = p.nverts;
    end
case '()'
    b = builtin('subsref', p, s)
    %error('indexing not supported with solpart objects');
case '{}'
    error('indexing not supported with solpart objects');
end