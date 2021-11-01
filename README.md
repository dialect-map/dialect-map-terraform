# Dialect map: Terraform


### About
This repository contains the Terraform definition for all the necessary resources in order to run
the [Dialect map][dialect-map-repo] application.


### 🤖 Automatic provisioning
This repository has been design as a declarative, and **not actionable** set of Terraform definitions.

That means that all the modifications of the Terraform-defined resources **must not** be applied by any user,
but for the repository itself using the _GitHub Actions_ CI/CD system.

The conditions at which the CI/CD jobs trigger is a sensitive matter, as we do not want them to modify production
resources at an early stage. For this reason, we proposed the following conditions:

#### Validation
On _Pull Request_ creation, when a `.tf` file has been modified.

```yaml
on:
  pull_request:
    branches:
      - main
    paths:
      - "config/**/*.tf"
```

#### Application
On _push_ to the `main` branch, when a `.tf` file has been modified.

```yaml
on:
  push:
    branches:
      - main
    paths:
      - "config/**/*.tf"
```


### ☁️ Project provider
For this project, _Google Cloud Platform_ (`google`) is used as the chosen provider where the required
infrastructure will be hosted. The reason to rely on Google is that the integration with our existing NYU
accounts is basically free, given the relation between NYU IT and Google.


### 👤 Project authentication
The authentication between GCP and the repository CI/CD is performed by using a Service Account key as a **GitHub secret**.

This secret is read within the CI/CD steps and stored in a file, that can later be referenced by the env. variable
Terraform uses to connect to GCP projects: `GOOGLE_APPLICATION_CREDENTIALS`. More information about this authentication
method can be found in the [official docs][google-auth-docs].


### 🔐 Project secrets
In order to apply the Terraform configuration, there are secrets that need to be populated as environment variables.
The naming of these env. variables must follow the `TF_VAR_<variable_name>` format specified in the official
[Terraform documentation][terraform-vars-docs].

The complete list of secret Terraform variables can be seen at the [main variables.tf file][main-path-variables].


### 🗂️ Modules structure
This project has been designed so that there is a 1:1 correspondence between Terraform modules and GCP products,
all of which are defined within the `resources` folder. The reason not to choose _modules_ as the name of the folder
is that _modules_ has a different connotation in GIT.

Some of these modules are:

- **[access][module-path-access]**: to manage IAM permissions.
- **[caches][module-path-caches]**: to manage Redis and Memcached instances.
- **[cloud-run][module-path-cloud-run]**: to manage container deployments.
- **[databases][module-path-databases]**: to manage SQL databases.
- **[pub-sub][module-path-pub-sub]**: to manage Pub/Sub topics and subscriptions.
- **[registry][module-path-registry]**: to manage Docker registry options.
- **[storage][module-path-storage]**: to manage GC Storage buckets.


### ⚙️ Components
The Dialect Map project has several inter-connected components in order to offer the complete functionality.

#### Computing components
Those based on _Cloud Run_. Their access can be set to one of the following policies:
- **Authenticated** requires a _Bearer_ token. See the [Terraform guide][terraform-run-iam-docs].
- **Public access:** does not require a _Bearer_ token.

The project computing components have the following access policies:
- **Backend API:** public to avoid Firebase (suggested by the [end-users Auth guide][google-auth-docs-run]).
- **Frontend UI:** public by design.

#### Storage components
Those based on _Cloud SQL_. Their access can be set by a combination of the following methods:
- **White-listed IPs:** ranges of IPs that are always allowed.
- **Cloud SQL Proxy:** authentication based connection from Cloud Run resources.

The project storage components have the following access methods:
- **Main DB:** white-listed IPs for the CDS office, and Cloud SQL Proxy for the backend API component. 
  The latter was designed following the [PostgreSQL guide][google-auth-docs-sql], in addition to the usage 
  of the `host` keyword to establish a [Unix Domain Connection][alchemy-conn-docs].


[alchemy-conn-docs]: https://docs.sqlalchemy.org/en/13/dialects/postgresql.html#unix-domain-connections
[dialect-map-repo]: https://github.com/dialect-map/dialect-map
[google-auth-docs]: https://cloud.google.com/docs/authentication/production
[google-auth-docs-sql]: https://cloud.google.com/sql/docs/postgres/connect-run
[google-auth-docs-run]: https://cloud.google.com/run/docs/authenticating/overview
[main-path-variables]: ./config/variables.tf
[module-path-access]: ./config/resources/access
[module-path-caches]: ./config/resources/caches
[module-path-cloud-run]: ./config/resources/cloud-run
[module-path-databases]: ./config/resources/databases
[module-path-pub-sub]: ./config/resources/pub-sub
[module-path-registry]: ./config/resources/registry
[module-path-storage]: ./config/resources/storage
[terraform-run-iam-docs]: https://www.terraform.io/docs/providers/google/r/cloud_run_service_iam.html
[terraform-vars-docs]: https://www.terraform.io/docs/configuration/variables.html#environment-variables
