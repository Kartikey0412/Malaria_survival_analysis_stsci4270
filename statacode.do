use "\\rschfs1x\usercl\fall\kg458_STSCI4270F15\Desktop\malaria.dta" 
gen dn = district * nettype
stcox Iinse__1 stress i.district nettype dn, tvc(Iinse__1) texp(_t) nohr
gen ds = district * stress
stcox Iinse__1 stress i.district nettype ds, tvc(Iinse__1) texp(_t) nohr
gen di = district * Iinse__1
stcox Iinse__1 stress i.district nettype di, tvc(Iinse__1) texp(_t) nohr
gen sn = stress * nettype
stcox Iinse__1 stress i.district nettype sn, tvc(Iinse__1) texp(_t) nohr
gen si = stress * Iinse__1
stcox Iinse__1 stress i.district nettype si, tvc(Iinse__1) texp(_t) nohr
stcox c.Iinse__1 c.stress i.district i.nettype c.stress#c.Iinse__1, tvc(c.Iinse__1) texp(c._t) nohr
gen ni = nettype * Iinse__1
stcox Iinse__1 stress i.district nettype ni, tvc(Iinse__1) texp(_t) nohr
gen ni = nettype * insecticide
gen nii = nettype * insecticide
stcox insecticide stress i.district nettype nii, tvc(insecticide) texp(_t) nohr
gen sii = stress * insecticide
stcox Iinse__1 stress i.district nettype sii, tvc(Iinse__1) texp(_t) nohr
stcox insecticide stress i.district nettype sii, tvc(insecticide) texp(_t) nohr
save "\\rschfs1x\usercl\fall\kg458_STSCI4270F15\Desktop\malaria.dta", replace
stcox Iinse__1 stress i.district nettype, tvc(Iinse__1) texp(_t) nohr
stcox Iinse__1 stress i.district nettype, tvc(Iinse__1) texp(_t) nolog nohr bases(S0)
stcox Iinse__1 stress i.district nettype, tvc(Iinse__1) texp(_t) nolog nohr
predict mgale, mgale
gen itvc= Iinse__1*_t
stcox Iinse__1 stress i.district nettype itvc, nolog nohr bases(S0)
predict mgale, mgale
predict ld, ldisplace
twoway scatter ld mgale, xtitle(Martingale Residuals) ytitle(Likelihood Displacement)
predict sch*, sch
predict sca*, sca
predict scr*, scr
predict scr*, sco
twoway scatter scr1 i.district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr1 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr2 Iinse__1, xtitle(Insecticide transformed) ytitle(Score Residuals)
twoway scatter scr1 Iinse__1, xtitle(Insecticide transformed) ytitle(Score Residuals)
twoway scatter scr2 stress, xtitle(Stress) ytitle(Score Residuals)
twoway scatter scr3 district, xtitle(Stress) ytitle(Score Residuals)
twoway scatter scr4 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr5 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr6 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr11 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr7 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr7 nettype, xtitle(Nettype) ytitle(Score Residuals)
twoway scatter scr6 nettype, xtitle(Nettype) ytitle(Score Residuals)
twoway scatter scr3 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr4 district, xtitle(District) ytitle(Score Residuals)
twoway scatter scr5 district, xtitle(District) ytitle(Score Residuals)
twoway scatter sch1 days, xtitle(time in days) ytitle(Schoenfeld Residuals)
estat phtest, plot(Iinse__1)
estat phtest, plot(stress)
estat phtest, plot(nettype)
estat phtest, plot(district)
estat phtest, plot(i.district)
estat phtest, plot(2)
estat phtest, plot(2.district)
stcox Iinse__1 stress i.district nettype itvc, nolog bases(S0)
stcox Iinse__1 stress i.district nettype, tvc(Iinse__1) texp(_t)
