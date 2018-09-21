This is the code of paper "MGMMNC: a multi-graph matching with multiple network constraints model for identification of multidimensional regulatory modules".

"do_simulated_experiment.m" is the main code with two experiments, including "do_experiment_with_noise.m", "do_experiment_with_rate.m". "do_experiment_with_noise.m" is the experiment about the effects of different noise and "do_experiment_with_rate.m" simulates the missing-value situation of biological data.

"Generate_dataset.m" is our synthetic data generated with different noise and missing-value rate.

"Generate_laplacian_networks.m" generates association matrices between features, and calculates laplacian matrices.

"Generate_associated_matrixH_x.m" represents graph-smoothed similarity measurement between two graphs. "x" stands for two types of measurement ("D" means Euclidean distance and "P" is Pearson correlation coefficient).

In addition, "MGMMNC.m" is the code of our MGMMNC algorithm.