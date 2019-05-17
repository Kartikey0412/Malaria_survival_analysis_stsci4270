# Malaria_survival_analysis_stsci4270

The study is to analyze significant factors and their dependecy on time and their interaction effect which may eventually affect the time until the onset of malaria symptoms. The study was conducted in 3 anonymous districts of sub Saharan Africa to study the causal and determinative aspects of malaria.  
3.2 billion or half of the world population is at risk from malaria and Sub-Saharan Africa has the largest number of malaria cases in the world (89% of cases in 2015).
The high risk group consists of infants, pregnant women, patients of any infection compromising the immune system, and frequent travelers to areas of Sub-Saharan Africa.
Higher hazard of getting malaria is caused by bites of female mosquitoes and climatic conditions, e.g. high temperature and humidity, that increase the breeding of mosquitoes.
Key preventive measures especially include insecticide treatment e.g. insecticide treated nets - with possibly more than one type - and home insecticide spraying. Information of these is available in the dataset. 

In the analysis, both the effect of each covariate by itself was first investigated using Kaplan-Meier and Cox PH methods. In the data 600 subject level data was present. Afterwards a multivariable Cox PH model was built for significant covariates. As the model suggested time dependency, a multivariate extended Cox PH model was built from the data for including time varying covariates. Further investigation of the data suggested fractional polynomials to be used for covariates which had a non-linear effect on survival function. The last effect considered in the model was of interaction between the covariates. The study was concluded with the test of model adequacy which included residual analysis and overall goodness of fit of the model. Schoenfeld residuals were evaluated for valid PH assumtion and Score as well as displacement vs Martinagle residual plotted ofr investigating outlier observations. 

