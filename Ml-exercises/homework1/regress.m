function regress
file = csvread('\default_features_1059_tracks_5miss.csv');
IsNan = isnan(file);
for i = 1 : 1059
if(IsNan(i,70) == 1)
attr1 = file(i,1);
attr2 = file(i,2);
attr3 = file(i,3);
attr4 = file(i,4);
attr5 = file(i,5);
attr6 = file(i,6);
attr7= file(i,7);
attr8 = file(i,8);
attr9 = file(i,9);
attr10 = file(i,10);
attr11 = file(i,11);
attr12 =file(i,12);
attr13 = file(i,13);
attr14 =file(i,14);
attr15 =file(i,15);
attr16 =file(i,16);
attr17 =file(i,17);
attr18 =file(i,18);
attr19 =file(i,19);
attr20 =file(i,20);
attr21=file(i,21);
attr22 =file(i,22);
attr23 =file(i,23);
attr24=file(i,24);
attr25=file(i,25);
attr26=file(i,26);
attr27=file(i,27);
attr28=file(i,28);
attr29=file(i,29);
attr30=file(i,30);
attr31=file(i,31);
attr32=file(i,32);
attr33 =file(i,33);
attr34 =file(i,34);
attr35 =file(i,35);
attr36 =file(i,36);
attr37 =file(i,37);
attr38 =file(i,38);
attr39=file(i,39);
attr40=file(i,40);
attr41=file(i,41);
attr42=file(i,42);
attr43=file(i,43);
attr44=file(i,44);
attr45=file(i,45);
attr46=file(i,46);
attr47=file(i,47);
attr48=file(i,48);
attr49=file(i,49);
att50=file(i,50);
attr51=file(i,51);
attr52=file(i,52);
%attr53=file(i,53);
attr54=file(i,53);
attr55=file(i,54);
attr56=file(i,55);
attr57=file(i,56);
attr58=file(i,57);
attr59=file(i,58);
attr60=file(i,59);
attr61=file(i,60);
attr62=file(i,61);
attr63=file(i,62);
attr64=file(i,63);
attr65=file(i,64);
attr66=file(i,65);
attr67=file(i,66);    
attr68=file(i,67);

  file(i,70) =  0.4475 * attr1 + -0.6931 * attr2 + 0.0732 * attr4 + -0.0372 * attr6 + -0.0344 * attr7 + -0.019  * attr11 + -1.3553 * attr18 +  1.3247 * attr19 + -0.0396 * attr21 + 0.0266 * attr26 + -0.0335 * attr27 +  0.0328 * attr29 + -0.0468 * attr30 + -0.0264 * attr31 + -0.249  * attr35 +  0.7137 * attr36 + -0.1287 * attr37 + -0.0644 * attr38 + -0.0625 * attr39 + -0.0587 * attr40 + -0.0452 * attr42 + 0.0254 * attr46 + 0.0269 * attr47 + -0.0316 * attr49 + 0.7299 * attr52 + 0.0511 * attr54 + 0.0232 * attr55 + 0.0855 * attr56 + 0.0516 * attr57 +  -0.0397 * attr60 + 0.0221 * attr61 + 0.035  * attr65 + 0.0401 * attr68 + -0.0063;

end
end
csvwrite('\default_features_1059_tracks_5.csv', file);
end
