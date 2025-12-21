# Advanced Reasoning of Quality Valued Configurations in Category Theory

This repository contains the replication package (models, operations, and empirical results) for the paper **"Advanced Reasoning of Quality Valued Configurations in Category Theory"**, currently **UNDER REVIEW** at *ACM Transactions on Software Engineering and Methodology (TOSEM)*.

This dataset serves as supplementary material to support the reproducibility of the experiments and case studies presented in the manuscript.

## 📂 Repository Structure

The repository is organized as follows:

* **/Models**: Contains the 4 full (folders `a`) and 4 sampled (folders `b`) feature-wise quality-measured SPLs. Each model is provided in 3 formats to support different solvers:
    * `.cql`: For **QVM/CQL IDE** (Our approach). Includes the code for the 6 quality-aware reasoning operations: `SATISFY`, `COUNT`, `FILTER`, `BOUND`, `RANDOM`, and `AGGREGATE`.
    * `.uvl`: For **UVLS/Z3**.
    * `.txt` / `.js`: For **HADAS/Clafer**.
* **/QAsCSVs**: Contains the variant-wise Quality Attributes (QAs) data:
    * `a)` 4 Large CSVs corresponding to the **complete** solution space.
    * `b)` 4 CSVs corresponding to the **randomly sampled** solution space.
* **TSEEvaluationResults&Statistics.xlsx**: A Microsoft Excel file containing the raw scalability results, performance comparison, and statistical analyses for non-linear regression approximation functions.

## 🛠️ Automated Reasoners & Tools

This repository focuses on the data and models. The automated reasoners used for the evaluation are third-party tools available at their official repositories:

* **CQL IDE** (Required for `.cql` files): [https://github.com/CategoricalData/CQL](https://github.com/CategoricalData/CQL)
* **UVLS**: [https://marketplace.visualstudio.com/items?itemName=caradhras.uvls-code](https://marketplace.visualstudio.com/items?itemName=caradhras.uvls-code)
* **HADAS**: [https://hadas.caosd.lcc.uma.es/](https://hadas.caosd.lcc.uma.es/)

## 🚀 Usage & Requirements

The dataset generation and experiments were conducted using **Java JDK 17.0.11**.

To replicate the QVM experiments:
1.  Download and install the **CQL IDE** from the link above.
2.  Open the desired `.cql` file from the `/Models` directory.
3.  Execute the operations defined within the file (SATISFY, FILTER, etc.) to observe the output.

## 📄 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

## 👥 Authors

* **Daniel-Jesus Munoz** - *ITIS Software, CAOSD, Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain*
* **Mónica Pinto** - *ITIS Software, CAOSD, Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain*
* **Dilian Gurov** - *EECS, TCS, Royal Institute of Technology (KTH), Stockholm, Sweden*
* **Lidia Fuentes** - *ITIS Software, CAOSD, Dpt. LCC, Universidad de Málaga, Andalucía Tech, Spain*
