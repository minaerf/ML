function [ reg ] = regressor20( X )
reg = zeros(size(X,1));
for i = 1: size(X,1)
reg(i) = ...
      0.0083 * X(i,1) + ...
     -0.0145 * X(i,2) + ...
      0.0112 * X(i,3) + ...
      0.0182 * X(i,4) + ...
      0.0871 * X(i,5) + ...
      0.1447 * X(i,6) + ...
     -0.0142 * X(i,7) + ...
     -0.0182 * X(i,8) + ...
     -0.0126 * X(i,9) + ...
      0.0008 * X(i,10) + ...
      0.0062 * X(i,11) + ...
     -0.0046 * X(i,12) + ...
     -0.0014 * X(i,13) + ...
      0.0125 * X(i,14) + ...
      0.0051 * X(i,15) + ...
      0.066  * X(i,16) + ...
     -0.0166 * X(i,17) + ...
     -0.1734 * X(i,18) + ...
     -0.0724 * X(i,19) + ...
     -0.0028 * X(i,21) + ...
     -0.0015 * X(i,23) + ...
     -0.0015 * X(i,24) + ...
     -0.0011 * X(i,25) + ...
     -0.0042 * X(i,26) + ...
     -0.008  * X(i,27) + ...
      0.0023 * X(i,29) + ...
     -0.0077 * X(i,30) + ...
     -0.0091 * X(i,31) + ...
      0.0025 * X(i,32) + ...
      0.0084 * X(i,33) + ...
     -0.0056 * X(i,34) + ...
      0.0071 * X(i,36) + ...
      0.0101 * X(i,37) + ...
      0.0013 * X(i,39) + ...
     -0.0008 * X(i,40) + ...
     -0.0817 * X(i,41) + ...
      0.1486 * X(i,43) + ...
     -0.1648 * X(i,44) + ...
      0.1515 * X(i,45) + ...
      0.0973 * X(i,46) + ...
      0.0435 * X(i,47) + ...
      0.0616 * X(i,48) + ...
     -0.15   * X(i,49) + ...
      0.1001 * X(i,50) + ...
      0.2457 * X(i,51) + ...
     -0.0714 * X(i,52) + ...
     -0.1199 * X(i,53) + ...
      0.4877 * X(i,54) + ...
     -0.0351 * X(i,55) + ...
      0.0293 * X(i,56) + ...
      0.0234 * X(i,57) + ...
      0.0117 * X(i,58) + ...
      0.0487 * X(i,59) + ...
      0.0526 * X(i,60) + ...
     -0.1286 * X(i,61) + ...
      0.0674 * X(i,62) + ...
      0.0064 * X(i,64) + ...
     -0.0032 * X(i,65) + ...
      0.0132 * X(i,66) + ...
     -0.0561 * X(i,67) + ...
     -0.1533 * X(i,68) + ...
     -0.0875 * X(i,69) + ...
      0.0479 * X(i,70) + ...
     -0.1028 * X(i,71) + ...
     -0.3361 * X(i,72) + ...
     -0.1923 * X(i,73) + ...
      0.1765 * X(i,74) + ...
      0.4617 * X(i,75) + ...
      0.391  * X(i,76) + ...
      0.1086 * X(i,77) + ...
      0.0004 * X(i,79) + ...
     -0.0007 * X(i,80) + ...
     -0.0017 * X(i,81) + ...
     -0.0049 * X(i,82) + ...
      0.0018 * X(i,83) + ...
      0.114  * X(i,84) + ...
     -0.0004 * X(i,85) + ...
     -0.024  * X(i,86) + ...
      0.0299 * X(i,87) + ...
      0.0353 * X(i,88) + ...
     -0.0049 * X(i,89) + ...
     -0.0005 * X(i,90) + ...
      0.0015 * X(i,91) + ...
     -0.004  * X(i,92) + ...
     -0.0006 * X(i,93) + ...
     -0.0058 * X(i,94) + ...
     -0.3806 * X(i,97) + ...
     -0.0135 * X(i,98) + ...
     -0.3216 * X(i,99) + ...
     -0.0023 * X(i,100) + ...
     -0.0065 * X(i,101) + ...
     -0.0012 * X(i,102) + ...
      0.0021 * X(i,103) + ...
     -0.0195 * X(i,104) + ...
     -0.0019 * X(i,105) + ...
     -0.0026 * X(i,106) + ...
      0.0035 * X(i,107) + ...
      0.0013 * X(i,108) + ...
     -0.0015 * X(i,109) + ...
      0.0078 * X(i,110) + ...
      0.0074 * X(i,111) + ...
      0.0045 * X(i,112) + ...
      0.0065 * X(i,114) + ...
      0.0082 * X(i,115) + ...
      0.0058 * X(i,116) + ...
      0.0013 * X(i,117) + ...
     -0.0013 * X(i,118) + ...
     -0.0059 * X(i,121) + ...
     -0.0095 * X(i,122) + ...
      0.0075 * X(i,123) + ...
      0.0328 * X(i,124) + ...
     -0.0191 * X(i,125) + ...
      0.0312 * X(i,126) + ...
     -0.011  * X(i,127) + ...
      0.006  * X(i,128) + ...
      0.0015 * X(i,130) + ...
     -0.0045 * X(i,131) + ...
     -0.0047 * X(i,132) + ...
     -0.001  * X(i,133) + ...
      0.0055 * X(i,134) + ...
     -0.0008 * X(i,135) + ...
      0.0103 * X(i,136) + ...
      0.4638 * X(i,137) + ...
      0.2927 * X(i,138) + ...
      0.1486 * X(i,139) + ...
      0.0054 * X(i,140) + ...
     -0.0066 * X(i,141) + ...
      0.0012 * X(i,142) + ...
     -0.0021 * X(i,143) + ...
      0.0023 * X(i,144) + ...
     -0.0009 * X(i,145) + ...
     -0.0069 * X(i,146) + ...
      0.0068 * X(i,147) + ...
      0.0071 * X(i,148) + ...
      0.0058 * X(i,149) + ...
     -0.0022 * X(i,150) + ...
     -0.0017 * X(i,151) + ...
     -0.0015 * X(i,153) + ...
      0.0169 * X(i,154) + ...
      0.0165 * X(i,155) + ...
     -0.0026 * X(i,156) + ...
     -0.006  * X(i,157) + ...
     -0.0006 * X(i,158) + ...
     -0.0005 * X(i,160) + ...
      0.0335 * X(i,164) + ...
      0.0178 * X(i,165) + ...
     -0.0009 * X(i,166) + ...
      0.0266 * X(i,167) + ...
      0.0982 * X(i,168) + ...
      0.0308 * X(i,169) + ...
      0.0025 * X(i,171) + ...
     -0.002  * X(i,172) + ...
      0.0042 * X(i,173) + ...
      0.0011 * X(i,174) + ...
      0.0013 * X(i,175) + ...
     -0.2222 * X(i,176) + ...
      0.0504 * X(i,177) + ...
      0.1955 * X(i,178) + ...
      0.0587 * X(i,179) + ...
      0.0021 * X(i,180) + ...
     -0.0035 * X(i,181) + ...
      0.0028 * X(i,182) + ...
     -0.0028 * X(i,184) + ...
      0.0024 * X(i,185) + ...
      0.0117 * X(i,186) + ...
     -0.0009 * X(i,188) + ...
      0.0029 * X(i,190) + ...
     -0.0039 * X(i,192) + ...
     -0.0021 * X(i,193) + ...
     -0.0041 * X(i,194) + ...
     -0.0089 * X(i,195) + ...
     -0.0044 * X(i,196) + ...
     -0.0017 * X(i,198) + ...
     -0.0007 * X(i,199) + ...
      0.002  * X(i,200) + ...
     -0.0198 * X(i,201) + ...
     -0.1365 * X(i,202) + ...
      0.0062 * X(i,203) + ...
      0.0024 * X(i,205) + ...
     -0.0196 * X(i,206) + ...
      0.1344 * X(i,207) + ...
     -0.0042 * X(i,208) + ...
      0.0029 * X(i,209) + ...
     -0.0056 * X(i,210) + ...
     -0.0073 * X(i,211) + ...
     -0.0035 * X(i,212) + ...
     -0.0016 * X(i,213) + ...
     -0.0194 * X(i,214) + ...
     -0.1367 * X(i,215) + ...
      0.0064 * X(i,216) + ...
      0.0011 * X(i,217) + ...
     -0.0194 * X(i,219) + ...
      0.1359 * X(i,220) + ...
     -0.004  * X(i,221) + ...
      0.0029 * X(i,222) + ...
     -0.0056 * X(i,223) + ...
     -0.0073 * X(i,224) + ...
     -0.0035 * X(i,225) + ...
     -0.0017 * X(i,226) + ...
      0.0206 * X(i,227) + ...
      0.0861 * X(i,228) + ...
     -0.0058 * X(i,229) + ...
     -0.0019 * X(i,230) + ...
     -0.001  * X(i,231) + ...
      0.0217 * X(i,232) + ...
      0.0789 * X(i,233) + ...
      0.0017 * X(i,234) + ...
      0.0084 * X(i,235) + ...
     -0.0211 * X(i,236) + ...
     -0.0208 * X(i,237) + ...
     -0.0135 * X(i,238) + ...
     -0.0118 * X(i,239) + ...
     -0.0269 * X(i,240) + ...
      0.0514 * X(i,241) + ...
     -0.0034 * X(i,242) + ...
     -0.0016 * X(i,243) + ...
     -0.001  * X(i,244) + ...
     -0.0269 * X(i,245) + ...
     -0.5684 * X(i,246) + ...
     -0.0007 * X(i,248) + ...
     -0.0445 * X(i,249) + ...
     -0.0648 * X(i,250) + ...
     -0.0418 * X(i,251) + ...
     -0.0226 * X(i,252) + ...
      0.0232 * X(i,253) + ...
     -0.0365 * X(i,254) + ...
     -0.0116 * X(i,255) + ...
     -0.0031 * X(i,256) + ...
      0.0229 * X(i,258) + ...
     -0.351  * X(i,259) + ...
      0.0015 * X(i,260) + ...
      0.0046 * X(i,261) + ...
      0.0114 * X(i,262) + ...
      0.0142 * X(i,263) + ...
      0.0097 * X(i,264) + ...
      0.0075 * X(i,265) + ...
     -0.2822 * X(i,266) + ...
     -0.1909 * X(i,267) + ...
     -0.2261 * X(i,268) + ...
     -0.004  * X(i,269) + ...
     -0.0512 * X(i,270) + ...
     -0.075  * X(i,271) + ...
      0.0042 * X(i,272) + ...
     -0.0082 * X(i,273) + ...
     -0.0026 * X(i,274) + ...
     -0.0011 * X(i,275) + ...
      0.002  * X(i,276) + ...
      0.0008 * X(i,277) + ...
      0.0008 * X(i,278) + ...
     -0.0024 * X(i,280) + ...
      0.536  * X(i,281) + ...
     -0.6442 * X(i,282) + ...
     -0.0471 * X(i,283) + ...
      0.1299 * X(i,284) + ...
     -0.0005 * X(i,285) + ...
      0.0011 * X(i,286) + ...
     -0.0015 * X(i,287) + ...
      0.0035 * X(i,289) + ...
     -0.0028 * X(i,290) + ...
     -0.0013 * X(i,294) + ...
      0.0014 * X(i,295) + ...
     -0.0005 * X(i,297) + ...
      0.0016 * X(i,298) + ...
     -0.0007 * X(i,299) + ...
      0.0006 * X(i,301) + ...
     -0.0007 * X(i,302) + ...
     -0.456  * X(i,303) + ...
     -0.1659 * X(i,304) + ...
      0.2823 * X(i,305) + ...
     -0.3811 * X(i,306) + ...
     -0.02   * X(i,307) + ...
     -0.0165 * X(i,308) + ...
      0.0094 * X(i,309) + ...
      0.8646 * X(i,311) + ...
     -0.3089 * X(i,312) + ...
     -0.2785 * X(i,313) + ...
     -0.0028 * X(i,314) + ...
      0.1384 * X(i,315) + ...
      0.6803 * X(i,316) + ...
     -0.1063 * X(i,317) + ...
     -0.0861 * X(i,318) + ...
      0.0786 * X(i,319) + ...
     -0.2159 * X(i,320) + ...
      0.4383 * X(i,321) + ...
      0.2359 * X(i,322) + ...
     -0.1973 * X(i,323) + ...
     -0.1393 * X(i,324) + ...
     -0.3284 * X(i,325) + ...
     -0.1817 * X(i,326) + ...
     -0.7149 * X(i,327) + ...
      0.3263 * X(i,328) + ...
      0.6024 * X(i,329) + ...
      0.3679 * X(i,330) + ...
     -0.2107 * X(i,331) + ...
     -0.0795 * X(i,332) + ...
     -0.0507 * X(i,333) + ...
      0.1531 * X(i,334) + ...
     -0.0459 * X(i,335) + ...
     -0.0121 * X(i,336) + ...
      0.2217 * X(i,337) + ...
      0.0897 * X(i,338) + ...
     -0.2443 * X(i,339) + ...
     -0.1055 * X(i,340) + ...
      0.0962 * X(i,341) + ...
     -0.3133 * X(i,342) + ...
      0.3735 * X(i,343) + ...
     -0.1585 * X(i,344) + ...
      0.014  * X(i,345) + ...
      0.0516 * X(i,346) + ...
      0.1131 * X(i,347) + ...
     -0.0968 * X(i,348) + ...
     -0.0187 * X(i,349) + ...
     -0.0147 * X(i,350) + ...
     -0.0021 * X(i,351) + ...
      0.0174 * X(i,352) + ...
      0.0214 * X(i,353) + ...
     -0.0012 * X(i,354) + ...
     -0.0025 * X(i,355) + ...
      0.002  * X(i,356) + ...
      0.0018 * X(i,358) + ...
     -0.2302 * X(i,360) + ...
     -0.0202 * X(i,361) + ...
     -0.199  * X(i,362) + ...
     -0.2559 * X(i,363) + ...
     -0.0038 * X(i,365) + ...
     -0.0065 * X(i,366) + ...
     -0.0022 * X(i,367) + ...
      0.0007 * X(i,369) + ...
     -0.0076 * X(i,374) + ...
     -0.0031 * X(i,375) + ...
      0.0009 * X(i,376) + ...
      0.0061 * X(i,378) + ...
     -0.0021 * X(i,379) + ...
      0.1956 * X(i,382) + ...
      0.2731 * X(i,383) + ...
     -0.2619 * X(i,384) + ...
     -0.3193 * X(i,385) + ...
      0.2427 * X(i,386) + ...
      0.1528 * X(i,387) + ...
     -0.149  * X(i,388) + ...
     -0.0319 * X(i,389) + ...
     -0.4031 * X(i,390) + ...
      0.3519 * X(i,391) + ...
     -0.5206 * X(i,392) + ...
      0.1647 * X(i,393) + ...
      0.245  * X(i,394) + ...
      0.303  * X(i,395) + ...
      0.1149 * X(i,396) + ...
      0.4847 * X(i,397) + ...
      0.1998 * X(i,398) + ...
     -0.3081 * X(i,399) + ...
     -0.3261 * X(i,400) + ...
     -0.1787 * X(i,401) + ...
      0.2576 * X(i,402) + ...
      0.0363 * X(i,403) + ...
     -0.0283 * X(i,404) + ...
      0.1457 * X(i,405) + ...
      0.2614 * X(i,406) + ...
     -0.2861 * X(i,407) + ...
     -0.5671 * X(i,408) + ...
      0.4356 * X(i,409) + ...
      0.2269 * X(i,410) + ...
      0.5382 * X(i,411) + ...
      0.5561 * X(i,412) + ...
      0.0433 * X(i,413) + ...
      0.2787 * X(i,414) + ...
      0.1098 * X(i,415) + ...
     -0.4216 * X(i,416) + ...
     -0.0515 * X(i,417) + ...
     -0.2025 * X(i,418) + ...
      0.2291 * X(i,419) + ...
     -0.259  * X(i,420) + ...
      0.4562 * X(i,421) + ...
     -0.717  * X(i,422) + ...
     -0.0191 * X(i,423) + ...
     -0.0971 * X(i,424) + ...
     -0.099  * X(i,425) + ...
     -0.0414 * X(i,426) + ...
      0.0071 * X(i,428) + ...
     -0.0267 * X(i,429) + ...
      0.0089 * X(i,430) + ...
     -0.0015 * X(i,431) + ...
     -0.0046 * X(i,432) + ...
     -0.0021 * X(i,433) + ...
      0.0076 * X(i,434) + ...
      0.0083 * X(i,435) + ...
     -0.0018 * X(i,436) + ...
      0.2185 * X(i,439) + ...
      0.1537 * X(i,440) + ...
      0.1766 * X(i,441) + ...
     -0.4629 * X(i,442) + ...
      0.0021 * X(i,443) + ...
     -0.0012 * X(i,444) + ...
      0.0008 * X(i,445) + ...
     -0.0006 * X(i,446) + ...
     -0.001  * X(i,447) + ...
      0.003  * X(i,448) + ...
      0.0025 * X(i,452) + ...
     -0.001  * X(i,453) + ...
      0.0018 * X(i,455) + ...
     -0.0018 * X(i,456) + ...
     -0.0014 * X(i,457) + ...
      0.0025 * X(i,459) + ...
     -0.0029 * X(i,460) + ...
     -0.2379 * X(i,461) + ...
     -0.0322 * X(i,462) + ...
      0.5305 * X(i,463) + ...
     -0.0135 * X(i,464) + ...
     -0.0327 * X(i,465) + ...
     -0.0204 * X(i,466) + ...
     -0.1152 * X(i,467) + ...
     -0.0783 * X(i,468) + ...
      0.2292 * X(i,469) + ...
     -0.6569 * X(i,470) + ...
     -0.0618 * X(i,471) + ...
      0.1948 * X(i,472) + ...
     -0.156  * X(i,473) + ...
      0.3897 * X(i,474) + ...
      0.4446 * X(i,475) + ...
      0.4333 * X(i,476) + ...
      0.018  * X(i,477) + ...
     -0.2316 * X(i,478) + ...
     -0.2852 * X(i,479) + ...
     -0.0723 * X(i,480) + ...
     -0.3911 * X(i,481) + ...
     -0.2387 * X(i,482) + ...
     -0.406  * X(i,483) + ...
      0.1293 * X(i,484) + ...
      0.2781 * X(i,485) + ...
      0.5551 * X(i,486) + ...
     -0.3866 * X(i,487) + ...
      0.2288 * X(i,488) + ...
     -0.419  * X(i,489) + ...
     -0.1473 * X(i,490) + ...
     -0.0662 * X(i,491) + ...
      0.0777 * X(i,492) + ...
     -0.2337 * X(i,493) + ...
     -0.0908 * X(i,494) + ...
      0.2067 * X(i,495) + ...
      0.1576 * X(i,496) + ...
      0.1263 * X(i,497) + ...
      0.0256 * X(i,498) + ...
      0.3617 * X(i,499) + ...
     -0.3697 * X(i,500) + ...
      0.757  * X(i,501) + ...
     -0.087  * X(i,502) + ...
      0.0561 * X(i,503) + ...
      0.1808 * X(i,504) + ...
      0.0048 * X(i,505) + ...
      0.0039 * X(i,506) + ...
      0.0561 * X(i,508) + ...
     -0.0087 * X(i,509) + ...
     -0.0006 * X(i,510) + ...
      0.0033 * X(i,511) + ...
      0.0042 * X(i,513) + ...
      0.0006 * X(i,514) + ...
     -0.0012 * X(i,515) + ...
     -0.016  * X(i,516) + ...
     -0.0297 * X(i,517) + ...
      0.0024 * X(i,518) + ...
      0.0007 * X(i,520) + ...
     -0.0159 * X(i,521) + ...
      0.0142 * X(i,522) + ...
      0.0008 * X(i,524) + ...
      0.0012 * X(i,526) + ...
     -0.0009 * X(i,528) + ...
     -0.0098 * X(i,529) + ...
     -0.0251 * X(i,530) + ...
     -0.0012 * X(i,531) + ...
     -0.0024 * X(i,532) + ...
      0.001  * X(i,533) + ...
     -0.0098 * X(i,534) + ...
     -0.0177 * X(i,535) + ...
      0.0017 * X(i,536) + ...
      0.001  * X(i,537) + ...
     -0.0006 * X(i,539) + ...
     -0.0037 * X(i,540) + ...
      0.004  * X(i,541) + ...
      0.0144 * X(i,542) + ...
      0.0048 * X(i,543) + ...
      0.0159 * X(i,544) + ...
      0.0039 * X(i,545) + ...
      0.0144 * X(i,547) + ...
      0.0076 * X(i,548) + ...
     -0.0018 * X(i,549) + ...
     -0.0062 * X(i,550) + ...
     -0.0012 * X(i,552) + ...
      0.0007 * X(i,555) + ...
      0.0004 * X(i,556) + ...
     -0.0011 * X(i,557) + ...
     -0.1412 * X(i,559) + ...
     -0.3786 * X(i,560) + ...
      0.0427 * X(i,561) + ...
      0.243;
end
end

