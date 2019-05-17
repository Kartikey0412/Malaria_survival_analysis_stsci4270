use "\\rschfs1x\usercl\fall\jyo3_STSCI4270F15\Documents\Exam\malaria.dta", clear
stset days, fail(malaria)
drop in 122
drop in 251
stset days, fail(malaria)
sts graph, by(source)
sts test source, logrank
sts graph, by(behavior)
sts test behavior, logrank
sts graph, by(nettype)
drop in 257
stset days, fail(malaria)
sts graph, by(source)
sts test source, logrank
sts graph, by(behavior)
sts test behavior, logrank
sts graph, by(nettype)
sts test nettype, logrank
sts graph, by(district)
sts test district, logrank
stcox stress
stcox insecticide
stphplot, by(nettype) nolntime
xtile stress3 = stress, nquantiles(3)
table stress3
stphplot, by(stress3) nolntime
xtile insecticide3 = insecticide, nquantiles(3)
table insecticide3
stphplot, by(insecticide3) nolntime
stcoxkm, by(stress3)
stcoxkm, by(insecticide3)
stcox i.stress3, nolog
estat phtest, detail
estat phtest, plot(stress3)
estat phtest, plot(i.stress3)
stcox i.stress3, nolog
estat phtest, plot(i.stress3)
estat phtest, plot(stress3)
estat phtest, plot(1.stress3)
estat phtest, plot(2.stress3)
estat phtest, plot(3.stress3)
stcox i.insecticide3, nolog
estat phtest, detail
estat phtest, plot(1.insecticide3)
estat phtest, plot(2.insecticide3)
estat phtest, plot(3.insecticide3)
stcox nettype district stress insecticide
stcox nettype district stress
stcox nettype district stress insecticide source
stcox nettype district stress3 insecticide3
stcox nettype district i.stress3 i.insecticde3
stcox nettype district i.stress3 i.insecticide3
replace stress = 0 in 66
replace stress = 0 in 69
replace stress = 0 in 356
replace stress = 0 in 566
save "\\rschfs1x\usercl\fall\jyo3_STSCI4270F15\Documents\Exam\malaria.dta", replace
stset days, fail(malaria)
stcox stress, nohr basehc(hr)
predict hr1, hr
gen lnhr = ln(hr1)
line lnhr stress
line lnhr days
stcox insecticide, nohr basehc(hr)
stcox insecticide, nohr basehc(hr_insecticide)
predict hr1_insecticide, hr_insecticide
predict hr1_insecticide, hr_insecticide
stcox insecticide, nohr basehc(hri)
predict hri1, hri
drop hr hr1 lnhr hr_insecticide hri 
stcox insecticide, nohr basehc(hr)
predict hr1, hr
gen lnhr = ln(hr1)
line lnhr insecticide
stcox stress insecticide nettype district
stcox stress insecticide nettype district, tvc(insecticide) texp(_t) nohr
stcox stress insecticide nettype district, tvc(stress) texp(_t) nohr
stcox stress insecticide nettype district, tvc(nettype) texp(_t) nohr
stcox stress insecticide nettype district, tvc(insecticide) texp(ln(_t)) nohr
xtile insecticide3 = insecticide, nquantiles(3)
table insecticide3
stcox stress insecticide3 nettype district, tvc(insecticide3) texp(_t) nohr
stcurve, survival at1(insecticide3=1)
stcox stress insecticide3 nettype district, nohr
stcurve, survival at1(insecticide3=1)
stcurve, survival at1(insecticide3)
stcurve, insecticide3
stcurve insecticide3
stcurve, survival at1(insecticide3=1) at2(insecticide3=2) at3(insecticide3=3)
stcox stress insecticide nettype district, tvc(insecticide) texp(_t) nohr
stcox stress insecticide nettype district, tvc(insecticide) texp(ln(_t)) nohr
stcox stress insecticide nettype district, nohr
stcox stress insecticide nettype district, tvc(insecticide) texp(ln(_t)) nohr
stcox stress insecticide nettype district, tvc(insecticide) texp(_t) nohr
summarize stress, detail
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
display (r(p50)+1+r(p75))/2
display (r(p75)+1+r(max))/2
gen stress_q = stress
recode stress_q -.1052632/7.112782=1 8.112782/10.42105=2 11.42105/13.12782=3 14.12782/19.14286=4
stcox i.stress_q insecticide nettype district, tvc(insecticide) texp(_t)
gen stress_q = stress
drop stress_q 
recode stress_q -1/7=1 8/10=2 11/13=3 14/19=4
gen stress_q = stress
recode stress_q -1/7=1 8/10=2 11/13=3 14/19=4
stcox i.stress_q insecticide nettype district, tvc(insecticide) texp(_t)
stcox i.stress_q insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
xtile stress4 = stress, nquantiles(4)
table stress4
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr basehc(hr)
stcox i.stress4 insecticide nettype district, nohr basehc(hr)
drop hr hr1 lnhr 
stcox i.stress4 insecticide nettype district, nohr basehc(hr)
predict hr1, hr
gen lnhr = ln(hr1)
line lnhr stress4
line lnhr stress
line lnhr stress4
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
stcox i.stress_q insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
summarize stress, detail
summarize stress4, detail
table stress4
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
summarize stress, detail
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
display (r(min) + r(p25))/2
display (r(p25)+.000001+r(p50))/2
display (r(p50)+.000001+r(p75))/2
display (r(p75)+.000001+r(max))/2
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
stcox stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
stcox i.stress4 insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
summarize insecticide, detail
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
display (r(p50)+1+r(p75))/2
display (r(p75)+1+r(max))/2
gen insecticide_q = insecticide
recode insecticide_q 0/93=1 94/141=2 142/187=3 188/350=4
stcox stress i.insecticide_q nettype district, tvc(i.insecticide_q) texp(_t) nolog nohr
gen insecticide_lnt = insecticide * ln(days)
summarize insecticide_lnt, detail
stcox stress i.insecticide_q nettype district, nolog nohr
fracpoly, degree(3) compare: stcox insecticide stress district nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(3) compare: stcox insecticidestress district nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(3) compare: stcox insecticide                                                                stress district nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(2) compare: stcox insecticide                                                                stress district nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(1) compare: stcox insecticide                                                                stress district nettype, tvc(insecticide) texp(_t) nohr
x = (insecticide + 1)/100
gen x = (insecticide + 1)/100
gen insecticide2 = x^(.5) - 1.188548092
gen lrn = -1.175303 * insecticide2
drop lrn 
gen lrh = -1.175303 * insecticide2
plot(insecticide, lrh, type="l")
line lrh insecticide
points lrh insecticide
scatter lrh insecticide
drop x insecticide2 lrh 
gen lrh = -1.175303 * Iinse__1
scatter lrh insecticide
fracpoly, degree(3) compare: stcox stress                                                                    insecticide district nettype, tvc(insecticide) texp(_t) nohr
stcox stress insecticide nettype district, tvc(insecticide) texp(_t) nolog nohr
recode lrh = -.0058268 * insecticide
drop lrh 
gen lrh = -.0058268 * insecticide
scatter lrh insecticide
gen districtxnettype = district * nettype
stcox stress insecticide nettype i.district, tvc(insecticide) texp(_t) nohr
sts test i.district, logrank
sts test district, logrank
stcox stress insecticide nettype i.district, tvc(insecticide) texp(_t) nohr
stcox stress insecticide nettype i.district, tvc(insecticide) texp(ln(_t)) nohr
stcox stress i.insecticide_q nettype i.district, tvc(i.insecticide_q) texp(_t) nolog nohr
stcox i.stress4 insecticide nettype i.district, tvc(insecticide) texp(_t) nolog nohr
fracpoly, degree(3) compare: stcox insecticide                                                                stress i.district nettype, tvc(insecticide) texp(_t) nohr
gen district2 = i.district == 2
tabulate district, generate(dum)
list
list dum1, dum2, dum3
list dum1 dum2
drop dum1 dum2 dum3 
xi i.district
list _Idistrict_1 _Idistrict_2
stcox stress insecticide nettype _Idistrict_1 _Idistrict_2, tvc(insecticide) texp(_t) nolog nohr
fracpoly, degree(3) compare: stcox stress                                                                    insecticide _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(3) compare: stcox insecticide                                                                    stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(2) compare: stcox insecticide                                                                    stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(1) compare: stcox insecticide                                                                    stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
stcox Iinse__1 stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
stcox Iinse__1 stress _Idistrict_1 _Idistrict_2 nettype, tvc(Iinse__1) texp(_t) nohr
drop lrh 
gen lrh = -1.174652 * Iinse__1
scatter lrh insecticide
fracpoly, degree(1) compare: stcox insecticide                                                                    stress _Idistrict_1 _Idistrict_2 nettype, nohr
stcox Iinse__1 stress _Idistrict_1 _Idistrict_2 nettype, tvc(Iinse__1) texp(_t) nohr
stcox Iinse__1 stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
fracpoly, degree(1) compare: stcox insecticide                                                                    stress _Idistrict_1 _Idistrict_2 nettype, tvc(insecticide) texp(_t) nohr
summarize insecticide, detail
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
display (r(p50)+1+r(p75))/2
display (r(p75)+1+r(max))/2
gen insecticide_q = insecticide
gen insecticide_t = insecticide * time
gen insecticide_t = insecticide * days
summarize insecticide_t, detail
display (r(min) + r(p25))/2
display (r(p25)+1+r(p50))/2
display (r(p50)+1+r(p75))/2
gen insecticide_q = insecticide
display (r(p75)+1+r(max))/2
gen insecticide_t_q = insecticide_t
recode insecticide_t_q 0/1551=1 1552/20790=2 20791/39501=3 39502/91260=4
stcox stress insecticide nettype district insecticide_t_q, nolog nohr
stcox stress insecticide nettype district i.insecticide_t_q, nolog nohr
stcox Iinse__1 stress _Idistrict_1 _Idistrict_2 nettype, tvc(Iinse__1) texp(_t) nohr
stcox Iinse__1 stress i.district nettype, tvc(Iinse__1) texp(_t) nohr
save "\\rschfs1x\usercl\fall\jyo3_STSCI4270F15\Documents\Exam\malaria.dta", replace
gen dn = district * nettype
