function p = subsasgn(p,index,val)

switch index.type
    case '()'
        val = builtin('subsasgn', p, index, val)
        %error('indexing with () not supported for object solpart');
    case '{}'
        error('indexing with {} not supported for object solpart');
    case '.'
        switch index.subs
            case 'config'
                p.config = val;
            case 'color'
                p.color = val;
            otherwise
                error('Invalid field');
        end
end
