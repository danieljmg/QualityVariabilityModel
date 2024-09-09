# QualityVariabilityModel
Advanced Reasoning of Quality Valued Configurations in Category Theory

This repository contains the models, operations and results empirically used in [UNDER REVIEW](https://doi.org/) at Journal of Transactions and Software Engineering.
Due to copyright issues, it does not contain the tools (i.e., automated reasoners), although their official sites are provided.

It is licensed under the [MIT license](https://github.com/danieljmg/QualityVariabilityModel/blob/main/LICENSE).


## TSE'24 Models, Categorical Operations and Datasets

This data-set contains:

1. **[/Models](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models)**: The 4 full (folders **a**) and 4 sampled (folders **b**) feature-wise quality-measured SPLs in 3 different formats; .txt and .js for [HADAS/Clafer](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/Clafer), .uvl for [UVLS/Z3](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/UVL) and .cql for [QVM/CQL](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM) IDE alongside the code for the 5 quality aware reasoning operations [SATISFY](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM/SATISFY), [COUNT](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM/COUNT), [FILTER](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM/FILTER), [RANDOM](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM/RANDOM) and [BOUND](https://github.com/danieljmg/QualityVariabilityModel/tree/main/Models/QVM/BOUND).
2. **[/QAsCSVs](https://github.com/danieljmg/QualityVariabilityModel/tree/main/QAsCSVs)**: The corresponding valued variant-wise Quality Attributes for the a) complete solution space in 4 large CSVs; and b) random sampled solution space in another 4 CSVs.
3. A Microsoft Excel file with the scalability results, comparisson, and statistic analyses for non-linear regression approximation functions.


## Automated Reasoners

- CQL IDE: https://github.com/CategoricalData/CQL
- UVLS: https://marketplace.visualstudio.com/items?itemName=caradhras.uvls-code
- HADAS: https://hadas.caosd.lcc.uma.es/


## Requirements

The data-set has been generated using Java JDK 17.0.11.

## Authors

1. **[Daniel-Jesus Munoz](https://github.com/danieljmg)**: [ITIS Software](https://www.uma.es/institutos-uma/info/118460/instituto-de-tecnologias-e-ingenieria-del-software/), [CAOSD](http://caosd.lcc.uma.es/), Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain
2. **Dilian Gurov**: [EECS](https://www.kth.se/en/eecs/), [TCS](https://www.kth.se/cs/tcs), Royal Institute of Technology (KTH), Stockholm, Sweden
3. **Mónica Pinto**: [ITIS Software](https://www.uma.es/institutos-uma/info/118460/instituto-de-tecnologias-e-ingenieria-del-software/), [CAOSD](http://caosd.lcc.uma.es/), Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain
4. **Lidia Fuentes**: [ITIS Software](https://www.uma.es/institutos-uma/info/118460/instituto-de-tecnologias-e-ingenieria-del-software/), [CAOSD](http://caosd.lcc.uma.es/), Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain
