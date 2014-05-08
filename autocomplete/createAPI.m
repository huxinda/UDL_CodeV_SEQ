[Narg,table,~] = xlsread('CodeVfunctions.xlsx',2);
table = table(2:end, :);
nkey = size(table,1);

fid = fopen('temp.xml','w');

for i = 1:nkey
        fprintf(fid,'<KeyWord name="%s" func="yes">\n',table{i,1});
        fprintf(fid,'\t<Overload retVal="{}" descr="%s" >\n',table{i,4});
        
        if Narg(i) ~=0
            paras = strtrim(strsplit(table{i,3},','));
            
            npara = Narg(i);
            
            nparainfo = length(paras);
            
            if nparainfo ~= npara
                disp(['Key#: ',num2str(i),': Parameter# not match']);
            end
                    
            for j = 1:npara
                fprintf(fid,'\t\t<Param name="%s" />\n',paras{j});
            end
            
        end
        fprintf(fid,'\t</Overload>\n');
        fprintf(fid,'</KeyWord>\n');
end

fclose(fid);